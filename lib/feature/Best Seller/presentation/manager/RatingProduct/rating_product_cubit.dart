import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'rating_product_state.dart';

class RatingProductCubit extends Cubit<RatingProductState> {
  RatingProductCubit() : super(RatingProductInitial());
int rating = 0;
   int myRating(){
    emit(MyRating());
    return rating;
  }
}
