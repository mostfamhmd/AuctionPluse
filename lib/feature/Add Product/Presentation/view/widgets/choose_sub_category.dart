import 'package:flutter/material.dart';
import 'package:smart_auction/core/widgets/Components/my_states.dart';
import 'package:smart_auction/feature/Add%20Product/Presentation/view/widgets/drop_down_list_sub_category.dart';

class ChooseSubCategory extends StatefulWidget {
  const ChooseSubCategory(
      {super.key,
      required this.subCategoryName,
      this.idCatSelected,
      this.selectedItems,
      this.onChanged});
  final ValueNotifier<List<String>> subCategoryName;
  final String? idCatSelected;
  final List<String>? selectedItems;
  final void Function(dynamic)? onChanged;

  @override
  State<ChooseSubCategory> createState() => _ChooseSubCategoryState();
}

class _ChooseSubCategoryState extends State<ChooseSubCategory> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: widget.subCategoryName,
        builder: (BuildContext context, value, Widget? child) =>
            value.isNotEmpty
                ? DropDownListSubCategory(
                    onChanged: widget.onChanged,
                    subCategoryName: value,
                    selectedItems: widget.selectedItems,
                  )
                : value.isEmpty && widget.idCatSelected != null
                    ? const FailureState(error: "create new sub category first")
                    : const Center());
  }
}
