import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_auction/core/widgets/Components/my_states.dart';
import 'package:smart_auction/feature/Categories%20Page/presentation/manager/Fetch%20Categories/fetch_categories_cubit.dart';
import 'package:smart_auction/feature/Home/presentation/view/widgets/Categories/categories_body.dart';

class CubitCategoryState extends StatelessWidget {
  const CubitCategoryState({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchCategoriesCubit, FetchCategoriesState>(
      builder: (context, state) {
        if (state is FetchCategoriesSuccess) {
          return CategoryBody(categories: state.getCategories.data!);
        } else if (state is FetchCategoriesLoading) {
          return const LoadingState();
        } else if (state is FetchCategoriesFailed) {
          return FailureState(
            error: state.error,
          );
        } else {
          return const Center();
        }
      },
    );
  }
}
