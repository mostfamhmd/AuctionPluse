import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/managers/Get%20Products%20Cubit/get_products_cubit.dart';
import 'package:smart_auction/core/widgets/Components/my_snack_bar.dart';
import 'package:smart_auction/core/widgets/Components/my_states.dart';
import 'package:smart_auction/feature/Waiting%20Room/data/models/wanted_event_model.dart';
import 'package:smart_auction/feature/Schedule%20Live%20View/presentation/managers/Get%20All%20Users%20Cubit/all_users_cubit.dart';
import 'package:smart_auction/feature/Schedule%20Live%20View/presentation/managers/Create%20Room%20Cubit/create_room_cubit.dart';
import 'package:smart_auction/feature/Schedule%20Live%20View/presentation/managers/Update%20Room%20Cubit/update_room_cubit.dart';

import 'app_bar_schedule_live.dart';
import 'info_schedule_live.dart';

class BodyScheduleLiveView extends StatefulWidget {
  const BodyScheduleLiveView({
    super.key,
    this.wantedRoom,
  });
  final WantedEventModel? wantedRoom;
  @override
  State<BodyScheduleLiveView> createState() => _BodyScheduleLiveViewState();
}

class _BodyScheduleLiveViewState extends State<BodyScheduleLiveView> {
  @override
  void initState() {
    context.read<AllUsersCubit>().getAllUsers();
    context.read<GetProductsCubit>().getAllProducts(isAuction: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          left: 20.w,
          right: 20.w,
        ),
        child: Column(
          children: [
            const AppBarScheduleLive(),
            BlocBuilder<GetProductsCubit, GetProductsState>(
              builder: (context, allProducts) {
                return BlocBuilder<AllUsersCubit, AllUsersState>(
                  builder: (context, allUsers) {
                    if (allProducts is GetProductsSuccess &&
                        allUsers is AllUsersSuccess) {
                      return BlocListener<UpdateRoomCubit, UpdateRoomState>(
                        listener: (context, state) {
                          if (state is UpdateRoomSuccess) {
                            mySuccessSnackBar(context, "Successfully Updated");
                            Navigator.pop(context);
                            Navigator.pop(context);
                            Navigator.pop(context);
                          } else if (state is UpdateRoomLoading) {
                            myLoadingSnackBar(
                                context, "Loading to update your room");
                          } else if (state is UpdateRoomError) {
                            myErrorSnackBar(context, state.errorMessage);
                          }
                        },
                        child: BlocListener<CreateRoomCubit, CreateRoomState>(
                          listener: (context, state) {
                            if (state is CreateRoomSuccess) {
                              mySuccessSnackBar(context,
                                  "created ${state.newEventModel.newRoom!.title} room successfully");
                              Navigator.pop(context);
                              Navigator.pop(context);
                            } else if (state is CreateRoomLoading) {
                              myLoadingSnackBar(
                                  context, "Loading to create your new room");
                            } else if (state is CreateRoomError) {
                              myErrorSnackBar(context, state.error);
                            }
                          },
                          child: InfoScheduleLive(
                              wantedRoom: widget.wantedRoom,
                              allProducts: allProducts.productsModel.data!,
                              allUsers: allUsers.users.data!),
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
              },
            ),
          ],
        ),
      ),
    );
  }
}
