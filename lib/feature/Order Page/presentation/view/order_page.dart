import 'package:flutter/material.dart';
import 'package:smart_auction/core/widgets/AppBar/back_app_bar.dart';
import 'package:smart_auction/feature/Login%20Page/presentation/manager/cubit/app_cubit_cubit.dart';
import 'package:smart_auction/feature/Order%20Page/presentation/view/widgets/body_order.dart';
import 'package:smart_auction/feature/Orders%20Page/data/models/orders_model.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key, required this.orderData});

  final OrdersModel orderData;

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  bool isRefresh = false;
  Future<void> handleRefresh() async {
    setState(() => isRefresh = true);

    AppCubit.get(context).getUserOrders();

    setState(() => isRefresh = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backAppBar(context, "Orders (${widget.orderData.results})"),
      body: RefreshIndicator(
        onRefresh: handleRefresh,
        child: BodyOrder(
          ordersModel: widget.orderData,
        ),
      ),
    );
  }
}
