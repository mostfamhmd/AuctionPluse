import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_auction/feature/Schedule%20Live%20View/presentation/managers/Create%20Room%20Cubit/create_room_cubit.dart';
import 'package:smart_auction/feature/Schedule%20Live%20View/presentation/managers/Generate%20Agora%20RTM%20Tokens%20Cubit/generate_agora_token_cubit.dart';
import 'package:smart_auction/feature/Schedule%20Live%20View/presentation/managers/Get%20All%20Users%20Cubit/all_users_cubit.dart';
import 'package:smart_auction/feature/Streaming%20Now%20View/presentation/view/widgets/app_bar_streaming.dart';

import 'widgets/body_streaming_now.dart';

class StreamingNowView extends StatelessWidget {
  const StreamingNowView({super.key});

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
        BlocProvider(
          create: (context) => GenerateAgoraTokenCubit(),
        ),
        BlocProvider(
          create: (context) => GenerateRTMTokenCubit(),
        ),
      ],
      child: Scaffold(
        appBar: appBarStreamingNow(context),
        body: const BodyStreamingNow(),
      ),
    );
  }
}
