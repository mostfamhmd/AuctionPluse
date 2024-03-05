import 'package:smart_auction/feature/Payment%20Page/data/Model/payment_method_model.dart';

import '../../../../core/utils/icons.dart';

List<PaymentMethodModel> paymentMethodModel = [
  PaymentMethodModel(
      paymentName: "Credit Card Or Debit", paymentIcon: AppIcons.kCreditCard),
  PaymentMethodModel(
      paymentName: "Paypal", paymentIcon: AppIcons.kPaypal),
  PaymentMethodModel(
      paymentName: "Bank Transfer", paymentIcon: AppIcons.kBank),
];