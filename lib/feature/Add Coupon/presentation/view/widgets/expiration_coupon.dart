// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/icons.dart';
import 'package:smart_auction/core/widgets/Components/my_custom_suffix_field.dart';
import 'package:smart_auction/core/widgets/Components/my_snack_bar.dart';

class ExpirationCoupon extends StatelessWidget {
  const ExpirationCoupon({
    super.key,
    required this.couponExpiration,
  });

  final TextEditingController couponExpiration;

  @override
  Widget build(BuildContext context) {
    return MyCustomSuffixField(
      myController: couponExpiration,
      textAlign: TextAlign.left,
      hintText:
          "ex: ${DateTime.now().toIso8601String().substring(0, 10).replaceAll("-", "/")}",
      isReadOnly: true,
      isIcon: false,
      widget: InkWell(
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
            builder: (context, child) {
              return Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: const ColorScheme.light(
                    primary: AppColors.kLightBlue,
                    onPrimary: AppColors.kBlack,
                    onSurface: AppColors.kBlack,
                  ),
                  textButtonTheme: TextButtonThemeData(
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.kBlack,
                    ),
                  ),
                ),
                child: child!,
              );
            },
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(DateTime.now().year),
            lastDate: DateTime(2100),
          );

          if (pickedDate != null) {
            String formattedDate = '';
            DateTime now = DateTime.now();
            if (pickedDate.isBefore(now)) {
              myLoadingSnackBar(context, "Choose an upcoming date");
              couponExpiration.text =
                  "ex: ${DateTime.now().toIso8601String().substring(0, 10).replaceAll("-", "/")}";
            } else if (pickedDate.isAfter(now)) {
              formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
              couponExpiration.text = formattedDate;
            }
          } else {
            myLoadingSnackBar(context, "Choose an upcoming date");
          }
        },
        child: SvgPicture.asset(
          AppIcons.kArrowMenu,
          fit: BoxFit.none,
        ),
      ),
    );
  }
}
