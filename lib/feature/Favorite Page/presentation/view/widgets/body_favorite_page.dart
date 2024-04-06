import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_auction/core/widgets/Components/my_states.dart';
import 'package:smart_auction/feature/Favorite%20Page/presentation/manager/WhichList%20Cubit/which_list_cubit.dart';
import '../../../../../core/widgets/Components/grid_view_for_view_product.dart';

class BodyFavoritePage extends StatefulWidget {
  const BodyFavoritePage({super.key});

  @override
  State<BodyFavoritePage> createState() => _BodyFavoritePageState();
}

class _BodyFavoritePageState extends State<BodyFavoritePage> {
  @override
  void initState() {
    context.read<WhichListCubit>().getWhichList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WhichListCubit, WhichListState>(
      builder: (context, state) {
        if (state is WhichListLoading) {
          return const LoadingState();
        } else if (state is WhichListSuccess) {
          return SingleChildScrollView(
            child: Column(
              children: [
                GridViewForViewProduct(
                  isDelete: true,
                  products: state.whichListModel.data,
                ),
              ],
            ),
          );
        } else if (state is WhichListError) {
          return FailureState(error: state.error);
        } else {
          return const FailureState(error: "Nothing to show");
        }
      },
    );
  }
}
