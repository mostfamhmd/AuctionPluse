import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_auction/core/utils/fonts.dart';
import 'package:smart_auction/core/widgets/Components/elevated_button.dart';
import 'package:smart_auction/feature/Authy%20Verification%20Screen/presentation/view/widgets/pin_put.dart';
import 'package:smart_auction/feature/Login%20Page/presentation/manager/cubit/app_cubit_cubit.dart';

class BodyAuthyVerify extends StatefulWidget {
  const BodyAuthyVerify({
    super.key,
  });

  @override
  State<BodyAuthyVerify> createState() => _BodyAuthyVerifyState();
}

class _BodyAuthyVerifyState extends State<BodyAuthyVerify> {
  List<TextEditingController> controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(15),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // title: authy verification
            const Text(
              'Authy Verification',
              style: TextStyle(
                fontFamily: AppFonts.kInter700,
                fontSize: 32,
              ),
            ),

            SizedBox(height: size.height * 0.02),

            // description
            const Text(
              'Copy the verification code in your authy application to verify this account recovery',
              style: TextStyle(
                fontFamily: AppFonts.kInter400,
                fontSize: 16,
              ),
            ),

            SizedBox(height: size.height * 0.07),

            // boxes to put auth numbers (pinput)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                6,
                (index) => customPinput(size, controllers[index]),
              ),
            ),

            SizedBox(height: size.height * 0.1),

            // submit
            Center(
              child: SizedBox(
                width: size.width * 0.5,
                child: customElevatedButton(context,
                    title: 'Submit verification', onPressed: () {
                  for (int i = 0; i < controllers.length; i++) {
                    context.read<AppCubit>().resetCode += controllers[i].text;
                  }
                  if (context.read<AppCubit>().resetCode.length == 6) {
                    context.read<AppCubit>().verification(context);
                  }
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
