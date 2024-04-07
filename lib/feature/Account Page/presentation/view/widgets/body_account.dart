import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/fonts.dart';
import 'package:smart_auction/core/utils/icons.dart';
import 'package:smart_auction/feature/Add%20Payment/presentation/view/add_payment.dart';
import 'package:smart_auction/feature/Address%20Page/presentation/view/address_page.dart';
import 'package:smart_auction/feature/Order%20Page/presentation/view/order_page.dart';
import 'package:smart_auction/feature/Profile%20Page/presentation/view/profile_page.dart';

class BodyAccount extends StatefulWidget {
  const BodyAccount({
    super.key,
  });

  @override
  State<BodyAccount> createState() => _BodyAccountState();
}

class _BodyAccountState extends State<BodyAccount> {
  List<String> icons = [
    AppIcons.kUserProfile,
    AppIcons.kBag,
    AppIcons.kLocation,
    AppIcons.kCreditCard,
  ];

  List<String> titles = [
    'Profile',
    'Order',
    'Address',
    'Payment',
  ];

  List<Widget> pages = [
    const ProfileScreen(),
    const OrderScreen(),
    const AddressScreen(),
    const AddPayementPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: icons.length,
        itemBuilder: (context, index) => ListTile(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => pages[index],
            ),
          ),
          leading: SvgPicture.asset(icons[index]),
          title: Text(
            titles[index],
            style: const TextStyle(
              fontFamily: AppFonts.kPoppins700,
              fontSize: 14,
              color: AppColors.kDarkBlue,
            ),
          ),
        ),
      ),
    );
  }
}
