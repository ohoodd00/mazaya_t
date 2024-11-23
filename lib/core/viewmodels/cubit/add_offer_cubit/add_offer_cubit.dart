import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mazaya/core/viewmodels/cubit/add_offer_cubit/add_offer_state.dart';

class AddOfferCubit extends Cubit<AddOfferState> {
  AddOfferCubit() : super(NotAdded());

  addState(int length) {
    int index = length;
    if (index != length) {
      emit(Added());
    } else {
      emit(NotAdded());
    }
  }
}
