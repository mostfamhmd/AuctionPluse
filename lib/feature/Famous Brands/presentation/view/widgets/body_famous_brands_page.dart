import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/widgets/Components/my_states.dart';
import 'package:smart_auction/feature/Famous%20Brands/data/model/get_brands_model.dart';
import 'package:smart_auction/feature/Famous%20Brands/presentation/view/widgets/first_three_brands.dart';
import 'package:smart_auction/feature/Specific%20Products/presentation/view/specific_products_view.dart';
import 'grid_view_item_builder.dart';

class BodyFamousBrandsPage extends StatefulWidget {
  const BodyFamousBrandsPage({super.key, required this.brands});
  final List<Brands> brands;

  @override
  State<BodyFamousBrandsPage> createState() => _BodyFamousBrandsPageState();
}

class _BodyFamousBrandsPageState extends State<BodyFamousBrandsPage> {
  List<Brands> firstThree = [];
  List<Brands> moreBrands = [];
  @override
  void initState() {
    if (widget.brands.length <= 3) {
      firstThree = widget.brands.sublist(0, widget.brands.length);
    } else {
      firstThree = widget.brands.sublist(0, 3);
    }
    if (widget.brands.length > 3) {
      moreBrands = widget.brands.sublist(3);
    }
    super.initState();
  }

  List<int> color = [0xFF3ACB3A, 0xFF538353, 0xFFFFB800];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: 5.w),
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            firstThree.isNotEmpty
                ? ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: firstThree.length,
                    itemBuilder: (context, index) => Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SpecificProducts(
                                  namePage: firstThree[index].name!,
                                  isBrand: true,
                                  brandId: firstThree[index].sId,
                                ),
                              ),
                            );
                          },
                          child: FirstThreeBrands(
                            brandName: firstThree[index].name!,
                            rankColor: color[index],
                            rankNum: index + 1,
                            topCard: 0,
                            imageURL: firstThree[index].image!,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    ),
                  )
                : const FailureState(error: "No Brands Found"),
            SizedBox(
              height: 20.h,
            ),
            moreBrands.isNotEmpty
                ? GridView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 100.h,
                    ),
                    itemCount: moreBrands.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SpecificProducts(
                                namePage: moreBrands[index].name!,
                                isBrand: true,
                                brandId: moreBrands[index].sId,
                              ),
                            ),
                          );
                        },
                        child: GridViewItemsBuilder(
                          name: moreBrands[index].name!,
                          imageURL: moreBrands[index].image!,
                          rank: index + 4,
                        ),
                      );
                    },
                  )
                : const Center(),
          ],
        ),
      ),
    );
  }
}
