import 'package:flutter/material.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/feature/Login%20Page/presentation/manager/cubit/app_cubit_cubit.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CheckOutPage extends StatelessWidget {
  const CheckOutPage({super.key, required this.id, required this.cartId});

  final String id;
  final String cartId;

  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
        Uri.parse(
          'https://checkout.stripe.com/c/pay/$id#fidkdWxOYHwnPyd1blpxYHZxWjA0SjBmfzNAN11RaUY8VlY1UmczTUtrd1FmcG5BaW52NHxsVlIxfXBmdGYxc0hBSktmX3I0V0ByNHF0MWBfZjNQPGpwNGxxfGhQTUJKandfXFA1MnVMMUZhNTVJY39sXGBMRycpJ2N3amhWYHdzYHcnP3F3cGApJ2lkfGpwcVF8dWAnPyd2bGtiaWBabHFgaCcpJ2BrZGdpYFVpZGZgbWppYWB3dic%2FcXdwYHgl',
        ),
      );

    return PopScope(
      canPop: false,
      child: Scaffold(
        body: SafeArea(
          child: WebViewWidget(controller: controller),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.kBlue,
          foregroundColor: AppColors.kWhite,
          onPressed: () {
            AppCubit().createCashOrder(cartId: cartId);
            Navigator.pop(context);
          },
          child: const Text('Done'),
        ),
      ),
    );
  }
}
