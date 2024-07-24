// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_auction/core/widgets/Components/my_snack_bar.dart';
import 'package:smart_auction/feature/Agora%20Live%20Page/presentation/view/widgets/close_and_dond_b_t_n.dart';
import 'package:smart_auction/feature/Home/presentation/view/home_view.dart';
import 'package:smart_auction/feature/Waiting%20Room/presentation/manager/RemoveHandCubit/remove_user_from_raised_hand_cubit.dart';
import 'package:smart_auction/feature/Schedule%20Live%20View/presentation/managers/Update%20Room%20Cubit/update_room_cubit.dart';

Future<dynamic> closeLiveDialog(
  BuildContext context, {
  AgoraClient? client,
  required String roomID,
}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return BlocListener<UpdateRoomCubit, UpdateRoomState>(
        listener: (context, state) async {
          if (state is UpdateRoomSuccess) {
            Navigator.pushAndRemoveUntil<void>(
              context,
              MaterialPageRoute<void>(
                  builder: (BuildContext context) => HomeView()),
              ModalRoute.withName('/'),
            );

            await client!.engine.leaveChannel();
          } else if (state is UpdateRoomError) {
            myErrorSnackBar(context, state.errorMessage);
          } else if (state is UpdateRoomLoading) {
            myLoadingSnackBar(context, "Leaving ...");
          }
        },
        child: BlocListener<RemoveLiveCubit, RemoveLiveState>(
          listener: (context, state) async {
            if (state is RemoveLiveSuccess) {
              Navigator.pushAndRemoveUntil<void>(
                context,
                MaterialPageRoute<void>(
                    builder: (BuildContext context) => HomeView()),
                ModalRoute.withName('/'),
              );
              await client!.engine.leaveChannel();
            } else if (state is RemoveLiveError) {
              myErrorSnackBar(context, state.error);
            } else if (state is RemoveLiveLoading) {
              myLoadingSnackBar(context, "Removing ...");
            }
          },
          child: AlertDialog(
            content: SizedBox(
                width: double.maxFinite,
                child: CloseAndDondBTN(
                  closeNameBTN: "Leave",
                  doneNameBTN: "End Live",
                  onCloseTap: () async {
                    context.read<UpdateRoomCubit>().updateRoom(
                          roomId: roomID,
                          event: false,
                        );
                  },
                  onDoneTap: () async {
                    context.read<RemoveLiveCubit>().removeLive(
                          roomID: roomID,
                        );
                  },
                )),
          ),
        ),
      );
    },
  );
}
