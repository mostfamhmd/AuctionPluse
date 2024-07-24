import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/consts.dart';
import 'package:smart_auction/core/widgets/Components/edit_and_delete.dart';
import 'package:smart_auction/core/widgets/Components/image_component.dart';
import 'package:smart_auction/feature/Sub%20Categories/presentation/view/sub_category_page.dart';
import '../../../../../core/utils/styles.dart';
import '../../../data/Model/category_model.dart';

class CategoryItem extends StatefulWidget {
  const CategoryItem({
    super.key,
    required this.category,
    required this.role,
    this.onPressedEdit,
    this.onPressedDelete,
  });
  final Category category;
  final String role;
  final void Function()? onPressedEdit;
  final void Function()? onPressedDelete;

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
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
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SubCategoryPage(
              categoryName: widget.category.name!,
              categoryId: widget.category.sId!,
            ),
          ),
        );
      },
      child: IntrinsicWidth(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageComponent(
                urlImage: widget.category.image!,
                height: 70.h,
                width: 70.w,
                radius: 5.r),
            SizedBox(
              width: 50.w,
            ),
            Text(
              widget.category.name!,
              style: AppStyles.kInter700.copyWith(fontSize: 16.sp),
            ),
            const Spacer(),
            userRole == "admin"
                ? EditAndDelete(
                    onPressedEdit: widget.onPressedEdit,
                    onPressedDelete: widget.onPressedDelete)
                : const Center(),
          ],
        ),
      ),
    );
  }
}
