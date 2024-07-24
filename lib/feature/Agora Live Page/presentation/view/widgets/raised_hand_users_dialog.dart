// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_auction/core/widgets/Components/my_states.dart';
import 'package:smart_auction/core/widgets/Components/shimmer_loading.dart';
import 'package:smart_auction/feature/Agora%20Live%20Page/presentation/view/widgets/close_and_dond_b_t_n.dart';
import 'package:smart_auction/feature/Waiting%20Room/data/models/wanted_event_model.dart';
import 'package:smart_auction/feature/Waiting%20Room/presentation/manager/RemoveHandCubit/remove_user_from_raised_hand_cubit.dart';
import 'package:smart_auction/feature/Schedule%20Live%20View/presentation/managers/Update%20Room%20Cubit/update_room_cubit.dart';

import 'list_users_raised_and_speaker.dart';

Future<dynamic> raisedHandUsersDialog(
  BuildContext context, {
  List<InvitedhostIds>? raisedHandUsers,
  required String roomID,
}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      List<String> selectedUsers = [];
      return AlertDialog(
        title: const FailureState(error: "press on done to confirm"),
        content: SizedBox(
          width: double.maxFinite,
          child: BlocBuilder<RemoveUserFromRaisedHandCubit,
              RemoveUserFromRaisedHandState>(
            builder: (context, state) {
              if (state is RemoveUserFromRaisedHandSuccess) {
                return state.updateddraisedHand.raisedHands!.isNotEmpty
                    ? ListUsersRaisedAndSpeaker(
                        selectedUsers: selectedUsers,
                        usersID: state.updateddraisedHand.raisedHands!)
                    : const FailureState(error: "Empty Raised Hands");
              } else if (state is RemoveUserFromRaisedHandLoading) {
                return const ShimmerLoading();
              } else {
                return raisedHandUsers != null || raisedHandUsers!.isNotEmpty
                    ? ListUsersRaisedAndSpeaker(
                        selectedUsers: selectedUsers,
                        usersID: raisedHandUsers.map((e) => e.sId!).toList())
                    : const FailureState(error: "Empty Raised Hands");
              }
            },
          ),
        ),
        actions: <Widget>[
          CloseAndDondBTN(
            onCloseTap: () => Navigator.of(context).pop(),
            onDoneTap: () {
              List<Map<String, String>> raisedHandIds = [];
              for (var i = 0; i < selectedUsers.length; i++) {
                raisedHandIds.add({
                  '_id': selectedUsers[i],
                });
              }
              context.read<UpdateRoomCubit>().updateRoom(
                    roomId: roomID,
                    idSpeaker: raisedHandIds,
                  );
              context
                  .read<RemoveUserFromRaisedHandCubit>()
                  .removeUserFromRaisedHand(
                      roomID: roomID, raisedHandUserID: selectedUsers);
            },
          )
        ],
      );
    },
  );
}
