import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_auction/feature/Schedule%20Live%20View/presentation/managers/cubit/all_users_cubit.dart';
import 'package:smart_auction/feature/Schedule%20Live%20View/presentation/view/manager/Create%20Room%20Cubit/create_room_cubit.dart';

import 'widgets/body_schedule_live_view.dart';

class ScheduleLiveView extends StatelessWidget {
  const ScheduleLiveView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AllUsersCubit(),
        ),
        BlocProvider(
          create: (context) => CreateRoomCubit(),
        ),
      ],
      child: const Scaffold(
        body: BodyScheduleLiveView(),
      ),
    );
  }
}
