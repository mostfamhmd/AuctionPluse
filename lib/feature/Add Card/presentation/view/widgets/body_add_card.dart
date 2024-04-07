import 'package:flutter/material.dart';
import 'package:smart_auction/core/widgets/Components/custom_text_form_field.dart';
import 'package:smart_auction/core/widgets/Components/custom_title.dart';
import 'package:smart_auction/core/widgets/Components/elevated_button.dart';

class BodyAddCard extends StatefulWidget {
  const BodyAddCard({
    super.key,
  });

  @override
  State<BodyAddCard> createState() => _BodyAddCardState();
}

class _BodyAddCardState extends State<BodyAddCard> {
  Size? size;
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
            // card number
            const CustomTitle(title: 'Card number'),
            SizedBox(height: size!.height * 0.01),
            customTextFormField(
              keyboardType: TextInputType.number,
            ),

            SizedBox(height: size!.height * 0.03),

            // expiration date
            const CustomTitle(title: 'Expiration date'),
            SizedBox(height: size!.height * 0.01),
            customTextFormField(
              keyboardType: TextInputType.datetime,
            ),

            SizedBox(height: size!.height * 0.03),

            // security code
            const CustomTitle(title: 'Security code'),
            SizedBox(height: size!.height * 0.01),
            customTextFormField(
              keyboardType: TextInputType.number,
            ),

            SizedBox(height: size!.height * 0.03),

            // card holder
            const CustomTitle(title: 'Card holder'),
            SizedBox(height: size!.height * 0.01),
            customTextFormField(
              keyboardType: TextInputType.name,
            ),

            SizedBox(height: size!.height * 0.03),

            // add card
            SizedBox(
              width: size!.width,
              child: customElevatedButton(
                context,
                title: 'Add card',
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
