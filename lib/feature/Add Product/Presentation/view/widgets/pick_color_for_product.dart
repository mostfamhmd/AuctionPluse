import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:smart_auction/core/utils/colors.dart';

class PickColorForProduct extends StatelessWidget {
  const PickColorForProduct(
      {super.key,
      this.selectedcolor,
      required this.onColorChanged,
      this.onPressed});
  final Color? selectedcolor;
  final void Function(Color) onColorChanged;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text(
        'Pick Color',
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
      children: [
        ColorPicker(
            pickerColor: selectedcolor ?? Colors.white,
            onColorChanged: onColorChanged),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: MaterialButton(
            onPressed: onPressed,
            color: AppColors.kDarkBlue,
            child: const Text(
              'Select Color',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}
