import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_auction/core/globals/glopals.dart';
import 'package:smart_auction/core/managers/Get%20Products%20Cubit/get_products_cubit.dart';
import 'package:smart_auction/core/widgets/Components/my_snack_bar.dart';
import 'package:smart_auction/core/widgets/Components/my_states.dart';
import 'package:smart_auction/feature/Agora%20Live%20Page/presentation/view/agora_live_page.dart';
import 'package:smart_auction/feature/Schedule%20Live%20View/presentation/managers/Create%20Room%20Cubit/create_room_cubit.dart';
import 'package:smart_auction/feature/Schedule%20Live%20View/presentation/managers/Get%20All%20Users%20Cubit/all_users_cubit.dart';
import 'info_live_stream.dart';

class BodyStreamingNow extends StatefulWidget {
  const BodyStreamingNow({
    super.key,
  });

  @override
  State<BodyStreamingNow> createState() => _BodyStreamingNowState();
}

class _BodyStreamingNowState extends State<BodyStreamingNow> {
  @override
  void initState() {
    context.read<AllUsersCubit>().getAllUsers();
    context.read<GetProductsCubit>().getAllProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProductsCubit, GetProductsState>(
        builder: (context, allProducts) {
      return BlocBuilder<AllUsersCubit, AllUsersState>(
        builder: (context, allUsers) {
          if (allProducts is GetProductsSuccess &&
              allUsers is AllUsersSuccess) {
            return BlocListener<CreateRoomCubit, CreateRoomState>(
              listener: (context, state) {
                if (state is CreateRoomSuccess) {
                  mySuccessSnackBar(context,
                      "created ${state.newEventModel.newRoom!.title} live successfully");
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AgoraLivePage(
                        isBroad: true,
                        userID: userId!,
                        agoraToken: state.newEventModel.newRoom!.agoraToken!,
                        title: state.newEventModel.newRoom!.title!,
                        rtmToken: state.newEventModel.newRoom!.rtmToken,
                      ),
                    ),
                  );
                } else if (state is CreateRoomLoading) {
                  myLoadingSnackBar(context, "Loading to create your new live");
                } else if (state is CreateRoomError) {
                  myErrorSnackBar(context, state.error);
                }
              },
              child: InfoLiveStream(
                allProducts: allProducts.productsModel.data!,
                allUsers: allUsers.users.data!,
              ),
            );
          } else if (allProducts is GetProductsLoading ||
              allUsers is AllUsersLoading) {
            return const LoadingState();
          } else if (allUsers is AllUsersError ||
              allProducts is GetProductsFailure) {
            if (allUsers is AllUsersError) {
              myErrorSnackBar(context, allUsers.error);
              return FailureState(error: allUsers.error);
            } else if (allProducts is GetProductsFailure) {
              myErrorSnackBar(context, allProducts.error);
              return FailureState(error: allProducts.error);
            } else {
              return const FailureState(
                  error: "Something is wrong in Error state");
            }
          } else {
            return const Center();
          }
        },
      );
    });
  }
}
