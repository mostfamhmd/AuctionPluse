import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/fonts.dart';
import 'package:smart_auction/core/utils/icons.dart';
import 'package:smart_auction/core/utils/styles.dart';
import 'package:smart_auction/feature/Address%20Page/presentation/view/address_page.dart';
import 'package:smart_auction/feature/Login%20Page/presentation/manager/cubit/app_cubit_cubit.dart';
import 'package:smart_auction/feature/Login%20Page/presentation/manager/cubit/app_cubit_state.dart';
import 'package:smart_auction/feature/Order%20Page/presentation/view/order_page.dart';
import 'package:smart_auction/feature/Profile%20Page/presentation/view/profile_page.dart';

class BodyAccount extends StatefulWidget {
  const BodyAccount({super.key, required this.userRole});

  final String userRole;

  @override
  State<BodyAccount> createState() => _BodyAccountState();
}

class _BodyAccountState extends State<BodyAccount> {
  @override
  Widget build(BuildContext context) {
    return widget.userRole == 'admin'
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
        : BlocProvider(
            create: (context) => AppCubit()
              ..getUserData()
              ..getUserAddress()
              ..getUserOrders(),
            child: BlocConsumer<AppCubit, AppStates>(
              listener: (context, state) {},
              builder: (context, state) {
                var cubit = AppCubit.get(context);
                var userData = cubit.loginDataModel;

                if (state is GetUserDataLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is GetUserDataFailure) {
                  return const Center(child: Text('Failed to load user data'));
                } else if (userData == null) {
                  return const Center(child: CircularProgressIndicator());
                }

                var orderData = cubit.ordersModel;

                if (state is GetUserOrdersLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is GetUserOrdersFailure) {
                  return const Center(
                      child: Text('Failed to load orders data'));
                } else if (orderData == null) {
                  return const Center(child: CircularProgressIndicator());
                }

                var addressData = cubit.addressModel;

                if (state is GetUserAddressLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is GetUserAddressFailure) {
                  return const Center(
                      child: Text('Failed to load addresses data'));
                } else if (addressData == null) {
                  return const Center(child: CircularProgressIndicator());
                }

                List<String> icons = [
                  AppIcons.kUserProfile,
                  AppIcons.kBag,
                  AppIcons.kLocation,
                ];

                List<String> titles = [
                  'Profile',
                  'Orders',
                  'Address',
                ];

                List<Widget> pages = [
                  ProfileScreen(userData: userData),
                  OrderScreen(orderData: orderData),
                  const AddressScreen(),
                ];

                return Padding(
                  padding: const EdgeInsets.all(15),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: icons.length,
                    itemBuilder: (context, index) => ListTile(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => pages[index],
                        ),
                      ),
                      leading: SvgPicture.asset(icons[index]),
                      title: Text(
                        titles[index],
                        style: const TextStyle(
                          fontFamily: AppFonts.kPoppins700,
                          fontSize: 14,
                          color: AppColors.kDarkBlue,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
  }
}
