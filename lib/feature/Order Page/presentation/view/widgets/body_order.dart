import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_auction/core/widgets/Components/custom_description.dart';
import 'package:smart_auction/core/widgets/Components/custom_title.dart';
import 'package:smart_auction/core/widgets/Components/my_states.dart';
import 'package:smart_auction/feature/Login%20Page/presentation/manager/cubit/app_cubit_cubit.dart';
import 'package:smart_auction/feature/Login%20Page/presentation/manager/cubit/app_cubit_state.dart';
import 'package:smart_auction/feature/Orders%20Page/data/models/orders_model.dart';

class BodyOrder extends StatelessWidget {
  const BodyOrder({
    super.key,
    required this.ordersModel,
  });

  final OrdersModel ordersModel;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        if (ordersModel.data!.isEmpty) {
          const FailureState(error: 'No orders yet');
        }

        return Padding(
          padding: const EdgeInsets.all(15),
          child: ListView.builder(
            itemCount: ordersModel.data!.length,
            itemBuilder: (context, index) => Card(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // product image
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: CachedNetworkImage(
                            imageUrl: ordersModel.data![index].cartItems![0]
                                .product!.imageCover!,
                            placeholder: (context, url) => const Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CircularProgressIndicator(),
                                  Text(
                                    'Loading..',
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                            errorWidget: (context, url, error) => const Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.error),
                                  Text(
                                    'There was a problem loading the image.',
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    // product title
                    CustomTitle(
                      title: ordersModel
                          .data![index].cartItems![0].product!.category!.name!,
                    ),

                    SizedBox(height: size.height * 0.01),

                    // date of order
                    CustomDescription(
                      description: ordersModel.data![index].createdAt!,
                    ),

                    SizedBox(height: size.height * 0.03),

                    // quantity
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomDescription(description: 'Quantity'),
                        CustomTitle(
                          title:
                              '${ordersModel.data![index].cartItems![0].quantity!}',
                          fontSize: 12,
                        ),
                      ],
                    ),

                    SizedBox(height: size.height * 0.01),

                    // price
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomDescription(description: 'Price'),
                        CustomTitle(
                          title: '${ordersModel.data![index].totalOrderPrice!}',
                          fontSize: 12,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
