import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/styles.dart';
import 'package:smart_auction/core/widgets/Components/drop_down_component.dart';
import 'package:smart_auction/core/widgets/Components/my_states.dart';

class ChooseBrand extends StatelessWidget {
  const ChooseBrand(
      {super.key,
      required this.isLoadingBrand,
      this.valBrand,
      this.onChanged,
      required this.brands});
  final ValueNotifier<bool> isLoadingBrand;
  final String? valBrand;
  final void Function(String?)? onChanged;
  final List<String> brands;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isLoadingBrand,
      builder: (BuildContext context, value, Widget? child) => value == false
          ? DropDownComponent(
              value: valBrand,
              onChanged: onChanged,
              hint: 'Select Brand',
              items: brands
                  .map(
                    (String item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: AppStyles.kPoppins400.copyWith(
                          fontSize: 14.sp,
                          color: Colors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  )
                  .toList(),
            )
          : const LoadingState(),
    );
  }
}
