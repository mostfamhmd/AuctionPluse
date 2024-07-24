import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_auction/core/models/product%20model/product_model.dart';
import 'package:smart_auction/core/utils/consts.dart';
import 'package:smart_auction/core/widgets/AppBar/basic_app_bar.dart';
import 'package:smart_auction/core/widgets/Drawer/my_drawer.dart';
import 'package:smart_auction/feature/Details%20Product/presentation/view/widgets/body_details_product.dart';
import 'package:smart_auction/feature/Favorite%20Page/presentation/manager/WhichList%20Cubit/which_list_cubit.dart';

class DetailsProductPage extends StatefulWidget {
  const DetailsProductPage({super.key, required this.product});
  final ProductInfo product;

  @override
  State<DetailsProductPage> createState() => _DetailsProductPageState();
}

class _DetailsProductPageState extends State<DetailsProductPage> {
  String userRole = "";

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
    if (userRole == "user") {
      context.read<WhichListCubit>().getWhichList();
    }
    return Scaffold(
      body: BodyDetailsProductPage(
        product: widget.product,
        userRole: userRole,
      ),
      endDrawer: const MyDrawer(),
      appBar: basicAppBar(
        context,
        widget.product.name!,
      ),
    );
  }
}
