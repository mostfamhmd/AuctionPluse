import 'package:flutter/material.dart';
import 'package:smart_auction/core/widgets/Components/custom_description.dart';
import 'package:smart_auction/core/widgets/Components/elevated_button.dart';
import 'package:smart_auction/feature/Add%20Address%20Page/presentation/view/add_address_page.dart';

import '../../../../../core/widgets/Components/custom_title.dart';

class BodyAddress extends StatelessWidget {
  const BodyAddress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: 2,
            itemBuilder: (context, index) => Card(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // user name
                    const CustomTitle(title: '"User name"'),

                    SizedBox(height: size.height * 0.02),

                    // user address
                    const CustomDescription(description: '"User address"'),

                    SizedBox(height: size.height * 0.02),

                    // user phone
                    const CustomDescription(description: '"User phone"'),

                    SizedBox(height: size.height * 0.02),

                    // edit address | delete it
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // edit
                        SizedBox(
                          width: size.width * 0.2,
                          child: customElevatedButton(
                            context,
                            title: 'Edit',
                            onPressed: () {},
                          ),
                        ),

                        SizedBox(width: size.width * 0.01),

                        // delete
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.delete_outline),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Spacer(),
          customElevatedButton(
            context,
            title: 'Add address',
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddAddressScreen(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
