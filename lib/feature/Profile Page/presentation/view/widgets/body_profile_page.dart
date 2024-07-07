import 'package:flutter/material.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/fonts.dart';
import 'package:smart_auction/core/utils/icons.dart';
import 'package:smart_auction/feature/Email%20Page/presentation/view/email_page.dart';
import 'package:smart_auction/feature/Login%20Page/data/login_model.dart';
import 'package:smart_auction/feature/Password%20Page/presentation/view/password_page.dart';

import 'list_view_pages.dart';

class BodyProfilePage extends StatefulWidget {
  const BodyProfilePage({
    super.key,
    required this.userData,
  });

  final LoginData userData;

  @override
  State<BodyProfilePage> createState() => _BodyProfilePageState();
}

class _BodyProfilePageState extends State<BodyProfilePage> {
  @override
  Widget build(BuildContext context) {
    List<String> icons = [
      //AppIcons.kUser,
      // AppIcons.kGender,
      // AppIcons.kDate,
      AppIcons.kMessage,
      // AppIcons.kPhone,
      AppIcons.kPassword,
    ];

    List<String> titles = [
      //'Name',
      // 'Gender',
      // 'Birthday',
      'Email',
      // 'Phone number',
      'Change password',
    ];

    List<Widget> pages = [
      //NameScreen(userData: widget.userData),
      // const GenderScreen(),
      // const BirthdayScreen(),
      EmailScreen(userData: widget.userData),
      // const PhoneScreen(),
      PasswordScreen(userData: widget.userData),
    ];

    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Text(
            '${widget.userData.data?.name}',
            style: const TextStyle(
              fontFamily: AppFonts.kPoppins700,
              fontSize: 16,
              color: AppColors.kDarkBlue,
            ),
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
