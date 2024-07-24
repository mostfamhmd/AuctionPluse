import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_auction/core/utils/icons.dart';
import 'package:smart_auction/core/widgets/Components/custom_title.dart';
import 'package:smart_auction/feature/Add%20Payment/presentation/view/widgets/credit_card_or_debit.dart';

class BodyAddPayment extends StatefulWidget {
  const BodyAddPayment({
    super.key,
  });

  @override
  State<BodyAddPayment> createState() => _BodyAddPaymentState();
}

class _BodyAddPaymentState extends State<BodyAddPayment> {
  List<Widget> pages = [
    const CreditCardOrDebit(),
    const CreditCardOrDebit(),
    const CreditCardOrDebit(),
  ];
  List<String> payIcons = [
    AppIcons.kCreditCard,
    AppIcons.kPaypal,
    AppIcons.kBank,
  ];
  List<String> payments = [
    'Credit card or Debit',
    'Paypal',
    'Bank transfer',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: payments.length,
      itemBuilder: (context, index) => ListTile(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => pages[index],
          ),
        ),
        leading: SvgPicture.asset(payIcons[index]),
        title: CustomTitle(title: payments[index]),
      ),
    );
  }
}
