import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/globals/glopals.dart';
import 'package:smart_auction/core/utils/styles.dart';
import 'package:smart_auction/core/widgets/Components/edit_and_delete.dart';
import 'package:smart_auction/feature/Specific%20Products/presentation/view/specific_products_view.dart';

class ItemSubCategory extends StatefulWidget {
  const ItemSubCategory({
    super.key,
    required this.name,
    required this.subCategoryId,
    required this.categoryName,
    this.onPressedEdit,
    this.onPressedDelete,
  });
  final String name;
  final String subCategoryId;
  final String categoryName;
  final void Function()? onPressedEdit;
  final void Function()? onPressedDelete;
  @override
  State<ItemSubCategory> createState() => _ItemSubCategoryState();
}

class _ItemSubCategoryState extends State<ItemSubCategory> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => SpecificProducts(
              namePage: widget.name,
              categoryName: widget.categoryName,
              subCategoryId: widget.subCategoryId,
            ),
          ),
        );
      },
      title: Row(
        children: [
          Text(
            widget.name,
            style: AppStyles.kInter700.copyWith(fontSize: 16.sp),
          ),
          const Spacer(),
          role == "user"
              ? EditAndDelete(
                  onPressedEdit: widget.onPressedEdit,
                  onPressedDelete: widget.onPressedDelete)
              : const Center(),
        ],
      ),
    );
  }
}
