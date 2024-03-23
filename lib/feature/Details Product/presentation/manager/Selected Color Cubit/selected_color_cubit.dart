import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum ColorSelectEvent { selectColor }

class ColorCubit extends Cubit<Color> {
  ColorCubit() : super(Colors.transparent);

  void selectColor(Color color) {
    emit(color);
  }
}
