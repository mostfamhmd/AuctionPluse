import 'package:flutter/material.dart';
import 'package:smart_auction/core/widgets/Components/custom_description.dart';
import 'package:smart_auction/core/widgets/Components/custom_title.dart';

class BodyOrder extends StatelessWidget {
  const BodyOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(15),
      child: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) => Card(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // product title
                const CustomTitle(title: '"Product title"'),

                SizedBox(height: size.height * 0.01),

                // date of order
                const CustomDescription(description: '"Date of order"'),

                SizedBox(height: size.height * 0.03),

                // status
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomDescription(description: 'Order status'),
                    CustomTitle(
                      title: '"Status"',
                      fontSize: 12,
                    ),
                  ],
                ),

                SizedBox(height: size.height * 0.01),

                // status
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomDescription(description: 'Items'),
                    CustomTitle(
                      title: '"Items"',
                      fontSize: 12,
                    ),
                  ],
                ),

                SizedBox(height: size.height * 0.01),

                // status
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomDescription(description: 'Price'),
                    CustomTitle(
                      title: '"Price"',
                      fontSize: 12,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
