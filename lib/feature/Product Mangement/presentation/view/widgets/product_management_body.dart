import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/styles.dart';
import 'package:smart_auction/core/widgets/Components/list_of_orders_or_products.dart';
import 'package:smart_auction/core/widgets/Components/my_snack_bar.dart';
import 'package:smart_auction/core/widgets/Components/my_states.dart';
import 'package:smart_auction/feature/Famous%20Brands/data/model/get_brands_model.dart';
import 'package:smart_auction/feature/Famous%20Brands/presentation/manager/Get%20Brands%20Cubit/get_brands_cubit.dart';
import 'package:smart_auction/feature/Product%20Mangement/presentation/manager/Get%20Admin%20Products%20Cubit/get_admin_products_cubit.dart';
import 'package:smart_auction/feature/Sub%20Categories/data/model/sub_category_model.dart';
import 'package:smart_auction/feature/Sub%20Categories/presentation/view/manager/Fetch%20Sub%20Categories/fetch_sub_categories_cubit.dart';

class ProductManagementBody extends StatefulWidget {
  const ProductManagementBody({super.key, required this.userRole});

  final String? userRole;

  @override
  State<ProductManagementBody> createState() => _ProductManagementBodyState();
}

class _ProductManagementBodyState extends State<ProductManagementBody> {
  SubCategoriesModel? subCategoriesModel;
  ValueNotifier<bool> isDoneSubs = ValueNotifier<bool>(false);
  GetBrandsModel? getBrandsModel;
  ValueNotifier<bool> isDoneBrand = ValueNotifier<bool>(false);
  @override
  void initState() {
    context.read<GetAdminProductsCubit>().getAdminProducts();
    context.read<GetBrandsCubit>().getBrands();
    context.read<FetchSubCategoriesCubit>().getSubCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.userRole != 'admin'
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
        : BlocListener<FetchSubCategoriesCubit, FetchSubCategoriesState>(
            listener: (context, subs) {
              if (subs is FetchSubCategoriesSuccess) {
                subCategoriesModel = subs.subCategoriesModel;
                isDoneSubs.value = false;
              } else if (subs is FetchSubCategoriesLoading) {
                isDoneSubs.value = true;
              } else if (subs is FetchSubCategoriesFailed) {
                myErrorSnackBar(context, subs.error);
                isDoneSubs.value = false;
              } else {
                myErrorSnackBar(context, "subs went wrong");
                isDoneSubs.value = false;
              }
            },
            child: BlocListener<GetBrandsCubit, GetBrandsState>(
              listener: (context, brand) {
                if (brand is GetBrandsSuccess) {
                  getBrandsModel = brand.getBrandsModel;
                  isDoneSubs.value = false;
                } else if (brand is GetBrandsLoading) {
                  isDoneSubs.value = true;
                } else if (brand is GetBrandsFailure) {
                  myErrorSnackBar(context, brand.errorMessage);
                  isDoneSubs.value = false;
                } else {
                  myErrorSnackBar(context, "subs went wrong");
                  isDoneSubs.value = false;
                }
              },
              child: ValueListenableBuilder(
                valueListenable: isDoneBrand,
                builder: (BuildContext context, value, Widget? child) =>
                    value == false
                        ? BlocBuilder<GetAdminProductsCubit,
                            GetAdminProductsState>(
                            builder: (context, admin) {
                              if (admin is GetAdminProductsLoading) {
                                return const Center(
                                  child: LoadingState(),
                                );
                              } else if (admin is GetAdminProductsSuccess) {
                                return admin.productsModel.data!.isNotEmpty
                                    ? Padding(
                                        padding: EdgeInsets.only(
                                          top: 5.h,
                                          bottom: 5.h,
                                        ),
                                        child: Column(
                                          children: [
                                            Expanded(
                                              child: ListOfOrdersOrProducts(
                                                adminProduct:
                                                    admin.productsModel.data!,
                                                getBrandsModel: getBrandsModel,
                                                subCategoriesModel:
                                                    subCategoriesModel,
                                                isEdit: true,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : const FailureState(
                                        error: "No Products Found",
                                      );
                              } else if (admin is GetAdminProductsFailure) {
                                return Center(
                                  child: FailureState(error: admin.message),
                                );
                              } else {
                                return const Center(
                                  child: FailureState(
                                    error: "Something went wrong",
                                  ),
                                );
                              }
                            },
                          )
                        : const Center(
                            child: LoadingState(),
                          ),
              ),
            ),
          );
  }
}
