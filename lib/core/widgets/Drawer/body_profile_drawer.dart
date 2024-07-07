import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/consts.dart';
import 'package:smart_auction/core/utils/styles.dart';
import 'package:smart_auction/feature/Login%20Page/presentation/manager/cubit/app_cubit_cubit.dart';
import 'package:smart_auction/feature/Login%20Page/presentation/manager/cubit/app_cubit_state.dart';
import 'package:smart_auction/feature/Profile%20Page/presentation/view/profile_page.dart';

class BodyProfileDrawer extends StatefulWidget {
  const BodyProfileDrawer({super.key});

  @override
  State<BodyProfileDrawer> createState() => _BodyProfileDrawerState();
}

class _BodyProfileDrawerState extends State<BodyProfileDrawer> {
  String userRole = '';

  Future<String> getUserRole() async {
    userRole = await AppConsts.getData(AppConsts.kUserRole);

    setState(() {});

    return userRole;
  }

  @override
  void initState() {
    getUserRole();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()
        ..getUserData()
        ..getUserOrders(),
      child: userRole == 'admin'
          ? const SizedBox()
          : BlocConsumer<AppCubit, AppStates>(
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

                return Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text(
                        '${userData.data?.name}',
                        maxLines: 2,
                        style: AppStyles.kInter700.copyWith(
                          fontSize: 32.sp,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        '${userData.data?.email}',
                        style: AppStyles.kInter400.copyWith(
                          fontSize: 18.sp,
                          color: AppColors.kGray,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileScreen(
                              userData: userData,
                            ),
                          ),
                        ),
                        borderRadius: BorderRadius.circular(10.r),
                        child: Container(
                          height: 55.h,
                          width: 270.w,
                          decoration: BoxDecoration(
                            color: AppColors.kLightBlue,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Center(
                            child: Text(
                              "Edit Profile",
                              style: AppStyles.kInter500.copyWith(
                                fontSize: 20.sp,
                                color: AppColors.kBlack,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
