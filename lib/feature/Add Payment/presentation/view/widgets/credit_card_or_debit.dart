import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_auction/core/widgets/Components/elevated_button.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/fonts.dart';
import 'package:smart_auction/feature/Add%20Card/presentation/view/add_card_page.dart';

class CreditCardOrDebit extends StatelessWidget {
  const CreditCardOrDebit({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Credit card or Debit'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                // الكارد
                Card(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.kLightBlue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        // الدايرتين
                        const Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Stack(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: CircleAvatar(
                                  radius: 10,
                                  backgroundColor: Colors.black26,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 17),
                                child: CircleAvatar(
                                  radius: 10,
                                  backgroundColor: Colors.black26,
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: size.height * 0.05),

                        // أرقام الكارد
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(
                            4,
                            (index) => SizedBox(
                              width: size.width * 0.18,
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(4),
                                ],
                                style: const TextStyle(
                                  fontFamily: AppFonts.kPoppins700,
                                  color: AppColors.kWhite,
                                ),
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  contentPadding: const EdgeInsets.all(8),
                                  filled: true,
                                  fillColor: AppColors.kGray.withOpacity(0.5),
                                ),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: size.height * 0.05),

                        // بيانات الكارد
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Card holder',
                                  style: TextStyle(
                                    fontFamily: AppFonts.kPoppins400,
                                    fontSize: 10,
                                    color: AppColors.kWhite,
                                  ),
                                ),
                                Text(
                                  'Ahmed Abdulbadea',
                                  style: TextStyle(
                                    fontFamily: AppFonts.kPoppins400,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Card save',
                                  style: TextStyle(
                                    fontFamily: AppFonts.kPoppins400,
                                    fontSize: 10,
                                    color: AppColors.kWhite,
                                  ),
                                ),
                                Text(
                                  '9/2030',
                                  style: TextStyle(
                                    fontFamily: AppFonts.kPoppins400,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // إضافة كارد جديد
                SizedBox(
                  width: size.width,
                  child: customElevatedButton(
                    context,
                    title: 'Add card',
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddCard(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
