import 'package:flutter/material.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/fonts.dart';
import 'package:smart_auction/core/widgets/Components/custom_title.dart';
import 'package:smart_auction/core/widgets/Components/elevated_button.dart';

class BodyGender extends StatefulWidget {
  const BodyGender({super.key});

  @override
  State<BodyGender> createState() => _BodyGenderState();
}

class _BodyGenderState extends State<BodyGender> {
  String dropdownValue = 'Male';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // choose gender
          const CustomTitle(title: 'Choose gender'),

          SizedBox(height: size.height * 0.01),

          // dropdown button for choose gender
          DropdownButton(
            padding: const EdgeInsets.all(10),
            hint: const Center(child: Text('Gender')),
            value: dropdownValue,
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.kBlue,
              fontFamily: AppFonts.kPoppins700,
            ),
            isExpanded: true,
            items: const [
              DropdownMenuItem(
                value: 'Male',
                child: Text('Male'),
              ),
              DropdownMenuItem(
                value: 'Female',
                child: Text('Female'),
              ),
            ],
            onChanged: (value) => setState(() {
              dropdownValue = value!;
            }),
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
