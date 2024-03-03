import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'is_favorite_state.dart';

class IsFavoriteCubit extends Cubit<IsFavoriteState> {
  IsFavoriteCubit() : super(IsFavoriteInitial());
}
