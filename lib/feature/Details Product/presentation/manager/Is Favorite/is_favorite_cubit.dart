import 'package:bloc/bloc.dart';

part 'is_favorite_state.dart';

class IsFavoriteCubit extends Cubit<IsFavoriteState> {
  IsFavoriteCubit() : super(IsFavoriteInitial());
  Future<void> addProduct({required String productId}) async {}
}
