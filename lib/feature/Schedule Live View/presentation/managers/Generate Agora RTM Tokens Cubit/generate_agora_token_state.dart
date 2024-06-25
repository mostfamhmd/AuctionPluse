part of 'generate_agora_token_cubit.dart';

sealed class GenerateAgoraTokenState {}

final class GenerateAgoraTokenInitial extends GenerateAgoraTokenState {}

final class GenerateAgoraTokenLoading extends GenerateAgoraTokenState {}

final class GenerateAgoraTokenSuccess extends GenerateAgoraTokenState {
  final AgoraRTMTokenModel generatedToken;
  GenerateAgoraTokenSuccess(this.generatedToken);
}

final class GenerateAgoraTokenError extends GenerateAgoraTokenState {
  final String errorMessage;
  GenerateAgoraTokenError(this.errorMessage);
}

sealed class GenerateRTMTokenState {}

final class GenerateRTMTokenInitial extends GenerateRTMTokenState {}

final class GenerateRTMTokenLoading extends GenerateRTMTokenState {}

final class GenerateRTMTokenSuccess extends GenerateRTMTokenState {
  final AgoraRTMTokenModel generatedToken;
  GenerateRTMTokenSuccess(this.generatedToken);
}

final class GenerateRTMTokenError extends GenerateRTMTokenState {
  final String errorMessage;
  GenerateRTMTokenError(this.errorMessage);
}
