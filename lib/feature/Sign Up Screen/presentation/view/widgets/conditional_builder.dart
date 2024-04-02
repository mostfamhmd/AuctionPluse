import 'package:flutter/material.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/feature/Login%20Page/presentation/manager/cubit/app_cubit_cubit.dart';

class ConditionsInSignupScreen extends StatelessWidget {
  const ConditionsInSignupScreen({super.key, required this.appCubit});

  final AppCubit appCubit;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => appCubit.changeCheckCondition(),
          icon: Icon(
            appCubit.isCheck
                ? Icons.check_box_outlined
                : Icons.check_box_outline_blank,
            color: appCubit.isCheck ? AppColors.kBlack : AppColors.kGray,
          ),
        ),
        const Flexible(
          child: Text(
            'By creating an avvount you have to agree with our them & condition',
            style: TextStyle(
              color: AppColors.kGray,
              fontSize: 11,
            ),
          ),
        ),
      ],
    );
  }
}
