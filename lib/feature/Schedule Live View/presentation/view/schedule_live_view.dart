import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_auction/feature/Live%20Show%20View/data/models/wanted_event_model.dart';
import 'package:smart_auction/feature/Schedule%20Live%20View/presentation/managers/Get%20All%20Users%20Cubit/all_users_cubit.dart';
import 'package:smart_auction/feature/Schedule%20Live%20View/presentation/managers/Create%20Room%20Cubit/create_room_cubit.dart';
import 'package:smart_auction/feature/Schedule%20Live%20View/presentation/managers/Generate%20Agora%20RTM%20Tokens%20Cubit/generate_agora_token_cubit.dart';
import 'package:smart_auction/feature/Schedule%20Live%20View/presentation/managers/Update%20Room%20Cubit/update_room_cubit.dart';

import 'widgets/body_schedule_live_view.dart';

class ScheduleLiveView extends StatelessWidget {
  const ScheduleLiveView({super.key, this.wantedRoom});
  final WantedEventModel? wantedRoom;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AllUsersCubit(),
        ),
        BlocProvider(
          create: (context) => UpdateRoomCubit(),
        ),
        BlocProvider(
          create: (context) => CreateRoomCubit(),
        ),
        BlocProvider(
          create: (context) => GenerateAgoraTokenCubit(),
        ),
        BlocProvider(
          create: (context) => GenerateRTMTokenCubit(),
        ),
      ],
      child: Scaffold(
        body: BodyScheduleLiveView(
          wantedRoom: wantedRoom,
        ),
      ),
    );
  }
}
