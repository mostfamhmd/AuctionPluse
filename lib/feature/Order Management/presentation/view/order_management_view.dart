import 'package:flutter/material.dart';
import 'package:smart_auction/core/utils/consts.dart';
import 'package:smart_auction/core/widgets/AppBar/basic_app_bar.dart';
import 'package:smart_auction/core/widgets/Drawer/my_drawer.dart';
import 'package:smart_auction/feature/Login%20Page/presentation/manager/cubit/app_cubit_cubit.dart';
import 'package:smart_auction/feature/Order%20Management/presentation/view/widget/order_management_body.dart';

class OrderManagementView extends StatefulWidget {
  const OrderManagementView({super.key});

  @override
  State<OrderManagementView> createState() => _OrderManagementViewState();
}

class _OrderManagementViewState extends State<OrderManagementView> {
  bool isRefresh = false;
  Future<void> handleRefresh() async {
    setState(() => isRefresh = true);

    AppCubit.get(context).getUserOrders();

    setState(() => isRefresh = false);
  }

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
    return Scaffold(
      appBar: basicAppBar(context, "Manage all orders"),
      body: RefreshIndicator(
        onRefresh: handleRefresh,
        child: OrderManagementBody(userRole: userRole),
      ),
      endDrawer: const MyDrawer(),
    );
  }
}
