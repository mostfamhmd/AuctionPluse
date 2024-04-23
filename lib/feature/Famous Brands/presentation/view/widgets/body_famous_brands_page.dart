import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/globals/glopals.dart';
import 'package:smart_auction/core/managers/Brand%20Cubits/Delete%20Brand%20Cubit/delete_brand_cubit.dart';
import 'package:smart_auction/core/widgets/Components/my_snack_bar.dart';
import 'package:smart_auction/core/widgets/Components/my_states.dart';
import 'package:smart_auction/feature/Add%20Brand/presentation/view/add_brand_view.dart';
import 'package:smart_auction/feature/Famous%20Brands/data/model/get_brands_model.dart';
import 'package:smart_auction/feature/Famous%20Brands/presentation/view/widgets/first_three_brands.dart';
import 'package:smart_auction/feature/Specific%20Products/presentation/view/specific_products_view.dart';
import 'grid_view_item_builder.dart';

class BodyFamousBrandsPage extends StatefulWidget {
  const BodyFamousBrandsPage({
    super.key,
    required this.brands,
  });
  final List<Brands> brands;

  @override
  State<BodyFamousBrandsPage> createState() => _BodyFamousBrandsPageState();
}

class _BodyFamousBrandsPageState extends State<BodyFamousBrandsPage> {
  ValueNotifier<List<Brands>> firstThree = ValueNotifier([]);
  ValueNotifier<List<Brands>> moreBrands = ValueNotifier([]);
  int? indx;

  @override
  void initState() {
    if (widget.brands.length <= 3) {
      firstThree.value = widget.brands.sublist(0, widget.brands.length);
    } else {
      firstThree.value = widget.brands.sublist(0, 3);
    }
    if (widget.brands.length > 3) {
      moreBrands.value = widget.brands.sublist(3);
    }
    super.initState();
  }

  List<int> color = [0xFF3ACB3A, 0xFF538353, 0xFFFFB800];
  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteBrandCubit, DeleteBrandState>(
      listener: (context, state) {
        if (state is DeleteBrandSuccess) {
          mySnackBar(context, state.success);
          widget.brands.remove(widget.brands[indx!]);
          if (widget.brands.length <= 3) {
            firstThree.value = widget.brands.sublist(0, widget.brands.length);
          } else {
            firstThree.value = widget.brands.sublist(0, 3);
          }
          if (widget.brands.length > 3) {
            moreBrands.value = widget.brands.sublist(3);
          }
          setState(() {});
        } else if (state is DeleteBrandError) {
          mySnackBar(context, state.error);
        } else if (state is DeleteBrandLoading) {
          mySnackBar(context, "Loading ...");
        }
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 5.w),
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              ValueListenableBuilder(
                valueListenable: firstThree,
                builder: (BuildContext context, value, Widget? child) => value
                        .isNotEmpty
                    ? ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 25.w),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: value.length,
                        itemBuilder: (context, index) => Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SpecificProducts(
                                      namePage: value[index].name!,
                                      isBrand: true,
                                      brandId: value[index].sId,
                                    ),
                                  ),
                                );
                              },
                              child: FirstThreeBrands(
                                onPressedDelete: () {
                                  context
                                      .read<DeleteBrandCubit>()
                                      .deleteBrand(brandId: value[index].sId!);
                                  indx = index;
                                  setState(() {});
                                },
                                onPressedEdit: () {
                                  Navigator.pushReplacement(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (BuildContext context,
                                              Animation<double> animation,
                                              Animation<double>
                                                  secondaryAnimation) =>
                                          AddBrandView(
                                        brand: value[index],
                                      ),
                                    ),
                                  );
                                },
                                role: role!,
                                brand: value[index],
                                rankColor: color[index],
                                rankNum: index + 1,
                                topCard: 0,
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                          ],
                        ),
                      )
                    : const FailureState(error: "No Brands Found"),
              ),
              SizedBox(
                height: 20.h,
              ),
              ValueListenableBuilder(
                valueListenable: moreBrands,
                builder: (BuildContext context, value, Widget? child) => value
                        .isNotEmpty
                    ? GridView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 100.h,
                        ),
                        itemCount: value.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SpecificProducts(
                                    namePage: value[index].name!,
                                    isBrand: true,
                                    brandId: value[index].sId,
                                  ),
                                ),
                              );
                            },
                            child: GridViewItemsBuilder(
                              onPressedDelete: () {
                                context
                                    .read<DeleteBrandCubit>()
                                    .deleteBrand(brandId: value[index].sId!);
                                indx = index + 3;
                                setState(() {});
                              },
                              onPressedEdit: () {
                                Navigator.pushReplacement(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (BuildContext context,
                                            Animation<double> animation,
                                            Animation<double>
                                                secondaryAnimation) =>
                                        AddBrandView(
                                      brand: value[index],
                                    ),
                                  ),
                                );
                              },
                              brand: value[index],
                              role: role!,
                              name: value[index].name!,
                              imageURL: value[index].image!,
                              rank: index + 4,
                            ),
                          );
                        },
                      )
                    : const Center(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
