import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker_theme.dart';
import 'package:flutter_holo_date_picker/widget/date_picker_widget.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/fonts.dart';
import 'package:smart_auction/core/widgets/Components/custom_title.dart';
import 'package:smart_auction/core/widgets/Components/elevated_button.dart';

class BodyBirthDay extends StatelessWidget {
  const BodyBirthDay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // your birthday
          const CustomTitle(title: 'Your birthday'),

          SizedBox(height: size.height * 0.01),

          // choose date of birth
          DatePickerWidget(
            looping: true,
            firstDate: DateTime(1950, 1, 1),
            lastDate: DateTime.now(),
            initialDate: DateTime(2000), // تتغير لتاريخ ميلاد المستخدم
            dateFormat: "dd/MMMM/yyyy",
            pickerTheme: const DateTimePickerTheme(
              backgroundColor: Colors.transparent,
              itemTextStyle: TextStyle(
                fontSize: 14,
                fontFamily: AppFonts.kPoppins700,
              ),
              dividerColor: AppColors.kDarkBlue,
            ),
            onChange: (dateTime, selectedIndex) {},
          ),

          SizedBox(height: size.height * 0.05),

          // save button
          SizedBox(
            width: size.width,
            child: customElevatedButton(
              context,
              title: 'Save',
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
