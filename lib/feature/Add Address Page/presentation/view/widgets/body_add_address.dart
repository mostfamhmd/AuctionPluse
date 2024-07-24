import 'package:flutter/material.dart';
import 'package:smart_auction/core/widgets/Components/custom_text_form_field.dart';
import 'package:smart_auction/core/widgets/Components/custom_title.dart';
import 'package:smart_auction/core/widgets/Components/elevated_button.dart';

class BodyAddAddress extends StatefulWidget {
  const BodyAddAddress({
    super.key,
  });

  @override
  State<BodyAddAddress> createState() => _BodyAddAddressState();
}

class _BodyAddAddressState extends State<BodyAddAddress> {
  Size? size;

  List<String> countries = [
    'Egypt',
    'Palestine',
    'United States',
    'United Kingdom',
  ];
  @override
  void initState() {
    size = MediaQuery.of(context).size;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // country or region
            const CustomTitle(title: 'Country or region'),
            SizedBox(height: size!.height * 0.01),
            DropdownButtonFormField(
              items: List.generate(
                countries.length,
                (index) => DropdownMenuItem(
                  value: countries[index],
                  child: Text(countries[index]),
                ),
              ),
              onChanged: (value) {},
            ),

            SizedBox(height: size!.height * 0.03),

            // last name
            const CustomTitle(title: 'Last name'),
            SizedBox(height: size!.height * 0.01),
            customTextFormField(
              keyboardType: TextInputType.name,
            ),

            SizedBox(height: size!.height * 0.03),

            // street address
            const CustomTitle(title: 'Street address'),
            SizedBox(height: size!.height * 0.01),
            customTextFormField(
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: size!.height * 0.03),

            // street address 2
            const CustomTitle(title: 'Street address 2 (Optional)'),
            SizedBox(height: size!.height * 0.01),
            customTextFormField(
              keyboardType: TextInputType.text,
            ),

            SizedBox(height: size!.height * 0.03),

            // city
            const CustomTitle(title: 'City'),
            SizedBox(height: size!.height * 0.01),
            customTextFormField(
              keyboardType: TextInputType.text,
            ),

            SizedBox(height: size!.height * 0.03),

            // state / province / region
            const CustomTitle(title: 'State/Province/Region'),
            SizedBox(height: size!.height * 0.01),
            customTextFormField(
              keyboardType: TextInputType.text,
            ),

            SizedBox(height: size!.height * 0.03),

            // zip code
            const CustomTitle(title: 'Zip code'),
            SizedBox(height: size!.height * 0.01),
            customTextFormField(
              keyboardType: TextInputType.number,
            ),

            SizedBox(height: size!.height * 0.03),

            // phone number
            const CustomTitle(title: 'Phone number'),
            SizedBox(height: size!.height * 0.01),
            customTextFormField(
              keyboardType: TextInputType.number,
            ),

            SizedBox(height: size!.height * 0.03),

            // add address
            SizedBox(
              width: size!.width,
              child: customElevatedButton(
                context,
                title: 'Add address',
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
