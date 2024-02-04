import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'is_tapped_state.dart';

class IsTappedCubit extends Cubit<IsTappedState> {
  IsTappedCubit() : super(IsTappedInitial());
}
