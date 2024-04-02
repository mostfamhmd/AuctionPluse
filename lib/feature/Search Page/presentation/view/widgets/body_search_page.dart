import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_auction/core/managers/Get%20Products%20Cubit/get_products_cubit.dart';
import 'package:smart_auction/core/models/product%20model/product_model.dart';
import 'package:smart_auction/core/widgets/Components/my_states.dart';
import 'package:smart_auction/feature/Search%20Page/presentation/view/widgets/appbar_and_list_products.dart';

class BodySearchPage extends StatefulWidget {
  const BodySearchPage({super.key});

  @override
  State<BodySearchPage> createState() => _BodySearchPageState();
}

class _BodySearchPageState extends State<BodySearchPage> {
  @override
  void initState() {
    context.read<GetProductsCubit>().getAllProducts();
    super.initState();
  }

  List<ProductInfo> products = [];
  ValueNotifier<bool> loading = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return BlocListener<GetProductsCubit, GetProductsState>(
      listener: (context, state) {
        if (state is GetProductsSuccess) {
          for (int i = 0; i < state.productsModel.data!.length; i++) {
            products.add(state.productsModel.data![i]);
          }
          loading.value = false;
        } else if (state is GetProductsFailure) {
          showDialog(
            context: context,
            builder: (context) => FailureState(error: state.error),
          );
          loading.value = false;
        } else if (state is GetProductsLoading) {
          loading.value = true;
        }
      },
      child: AppBarAndListOfProducts(
        loading: loading,
        products: products,
      ),
    );
  }
}
