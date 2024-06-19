import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_auction/feature/Filter%20Page/presentation/view/widgets/body_filter_page.dart';

import '../../../../core/widgets/AppBar/back_app_bar.dart';
import '../manager/Is Tapped Cubit/is_tapped_cubit.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IsTappedCubit(),
      child: Scaffold(
        appBar: backAppBar(context, "Filter Search"),
        body: const BodyFilterPage(),
      ),
    );
  }
}
