import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/styles.dart';
import 'package:smart_auction/core/widgets/Components/custom_description.dart';
import 'package:smart_auction/core/widgets/Components/custom_title.dart';
import 'package:smart_auction/feature/Login%20Page/presentation/manager/cubit/app_cubit_cubit.dart';
import 'package:smart_auction/feature/Login%20Page/presentation/manager/cubit/app_cubit_state.dart';

class OrderManagementBody extends StatelessWidget {
  const OrderManagementBody({super.key, required this.userRole});

  final String? userRole;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: userRole != 'admin'
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  'You do not have permission to view this page.',
                  textAlign: TextAlign.center,
                  style: AppStyles.kPoppins700,
                ),
              ),
            )
          : Padding(
              padding: EdgeInsets.only(top: 5.h, bottom: 5.h),
              child: BlocProvider(
                create: (context) => AppCubit()..getUserOrders(),
                child: BlocConsumer<AppCubit, AppStates>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    var cubit = AppCubit.get(context);

                    if (state is GetUserOrdersLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    return Padding(
                      padding: const EdgeInsets.all(15),
                      child: ListView.builder(
                        itemCount: cubit.ordersModel!.data!.length,
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
                                        imageUrl: cubit
                                            .ordersModel!
                                            .data![index]
                                            .cartItems![0]
                                            .product!
                                            .imageCover!,
                                        placeholder: (context, url) =>
                                            const Center(
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
                                        errorWidget: (context, url, error) =>
                                            const Center(
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
                                  title: cubit.ordersModel!.data![index]
                                      .cartItems![0].product!.category!.name!,
                                ),

                                SizedBox(height: size.height * 0.01),

                                // date of order
                                CustomDescription(
                                  description: cubit
                                      .ordersModel!.data![index].createdAt!,
                                ),

                                SizedBox(height: size.height * 0.03),

                                // quantity
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const CustomDescription(
                                        description: 'Quantity'),
                                    CustomTitle(
                                      title:
                                          '${cubit.ordersModel!.data![index].cartItems![0].quantity!}',
                                      fontSize: 12,
                                    ),
                                  ],
                                ),

                                SizedBox(height: size.height * 0.01),

                                // price
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const CustomDescription(
                                        description: 'Price'),
                                    CustomTitle(
                                      title:
                                          '${cubit.ordersModel!.data![index].totalOrderPrice!}',
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
                ),
              ),
            ),
    );
  }
}
