import 'package:flutter/material.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/fonts.dart';
import 'package:smart_auction/core/utils/icons.dart';
import 'package:smart_auction/core/widgets/Components/elevated_button.dart';
import 'package:smart_auction/feature/BirthDay%20Page/presentation/view/birth_day_page.dart';
import 'package:smart_auction/feature/Change%20Image%20Page/presentation/view/change_image_page.dart';
import 'package:smart_auction/feature/Email%20Page/presentation/view/email_page.dart';
import 'package:smart_auction/feature/Gender%20Page/presentation/view/gender_page.dart';
import 'package:smart_auction/feature/Name%20Page/presentation/view/name_page.dart';
import 'package:smart_auction/feature/Password%20Page/presentation/view/password_page.dart';
import 'package:smart_auction/feature/Phone%20Page/presentation/view/phone_page.dart';

import 'list_view_pages.dart';

class BodyProfilePage extends StatefulWidget {
  const BodyProfilePage({
    super.key,
  });

  @override
  State<BodyProfilePage> createState() => _BodyProfilePageState();
}

class _BodyProfilePageState extends State<BodyProfilePage> {
  List<String> icons = [
    AppIcons.kUser,
    AppIcons.kGender,
    AppIcons.kDate,
    AppIcons.kMessage,
    AppIcons.kPhone,
    AppIcons.kPassword,
  ];

  List<String> titles = [
    'Name',
    'Gender',
    'Birthday',
    'Email',
    'Phone number',
    'Change password',
  ];

  List<Widget> pages = [
    const NameScreen(),
    const GenderScreen(),
    const BirthdayScreen(),
    const EmailScreen(),
    const PhoneScreen(),
    const PasswordScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            children: [
              // user avatar
              Column(
                children: [
                  const CircleAvatar(radius: 40),

                  SizedBox(height: size.height * 0.01),

                  // change photo button
                  SizedBox(
                    height: size.height * 0.03,
                    width: size.width * 0.3,
                    child: customElevatedButton(
                      context,
                      title: 'Change',
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ChangeImageScreen(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: size.width * 0.03),
              // username
              const Text(
                'User Name',
                style: TextStyle(
                  fontFamily: AppFonts.kPoppins700,
                  fontSize: 16,
                  color: AppColors.kDarkBlue,
                ),
              ),
            ],
          ),

          // divider
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Divider(),
          ),

          // user data
          ListViewPages(icons: icons, pages: pages, titles: titles),
        ],
      ),
    );
  }
}
