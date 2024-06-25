import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/feature/Schedule%20Live%20View/data/models/agora_token_model.dart';
import 'package:smart_auction/feature/Schedule%20Live%20View/data/services/generate_agora_token_service.dart';

part 'generate_agora_token_state.dart';

class GenerateAgoraTokenCubit extends Cubit<GenerateAgoraTokenState> {
  GenerateAgoraTokenCubit() : super(GenerateAgoraTokenInitial());

  Future<void> generateAgoraToken({
    required String channelName,
  }) async {
    emit(GenerateAgoraTokenLoading());
    Either<ServerFailure, AgoraRTMTokenModel> result =
        await GenerateAgoraTokenService()
            .generateAgoraToken(channelName: channelName);
    result.fold((failure) {
      emit(GenerateAgoraTokenError(failure.errMessage));
    }, (generated) {
      emit(GenerateAgoraTokenSuccess(generated));
    });
  }
}

class GenerateRTMTokenCubit extends Cubit<GenerateRTMTokenState> {
  GenerateRTMTokenCubit() : super(GenerateRTMTokenInitial());
  Future<void> generateRTMToken() async {
    emit(GenerateRTMTokenLoading());
    Either<ServerFailure, AgoraRTMTokenModel> result =
        await GenerateAgoraTokenService().generateRTMToken();
    result.fold((failure) {
      emit(GenerateRTMTokenError(failure.errMessage));
    }, (generated) {
      emit(GenerateRTMTokenSuccess(generated));
    });
  }
}
