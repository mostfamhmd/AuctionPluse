// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/core/widgets/Components/my_states.dart';
import 'package:smart_auction/core/widgets/Components/shimmer_loading.dart';
import 'package:smart_auction/feature/Agora%20Live%20Page/presentation/view/widgets/list_tile_user_raise_hand.dart';
import 'package:smart_auction/feature/UpComing%20Live%20Shows%20View/data/services/get_user_service.dart';

class ListUsersRaisedAndSpeaker extends StatelessWidget {
  const ListUsersRaisedAndSpeaker({
    super.key,
    required this.selectedUsers,
    required this.usersID,
    this.icon,
  });
  final List<String> usersID;
  final List<String> selectedUsers;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: usersID.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final Stream getUserData =
              GetUserService().getUser(userID: usersID[index]);
          return StreamBuilder(
            stream: getUserData,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const ShimmerLoading();
              } else if (snapshot.hasData) {
                ValueNotifier valueNotifier = ValueNotifier(false);
                return ValueListenableBuilder(
                  valueListenable: valueNotifier,
                  builder: (BuildContext context, value, Widget? child) =>
                      ListTileUserRaiseHand(
                          icon: icon,
                          onTap: () {
                            if (value == true) {
                              selectedUsers.add(usersID[index]);
                              valueNotifier.value = false;
                            } else {
                              selectedUsers.remove(usersID[index]);
                              valueNotifier.value = true;
                            }
                          },
                          userName: snapshot.data!.data!.name!,
                          valBool: value),
                );
              } else {
                if (snapshot.error is DioException) {
                  ServerFailure serverFailure = ServerFailure.fromDioException(
                      dioException: snapshot.error as DioException);
                  return FailureState(error: serverFailure.errMessage);
                } else {
                  ServerFailure serverFailure =
                      ServerFailure(errMessage: snapshot.error.toString());
                  return FailureState(error: serverFailure.errMessage);
                }
              }
            },
          );
        });
  }
}
