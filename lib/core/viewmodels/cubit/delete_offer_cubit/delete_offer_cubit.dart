import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mazaya/core/viewmodels/cubit/delete_offer_cubit/delete_offer_state.dart';

class DeleteOfferCubit extends Cubit<DeleteOfferState> {
  DeleteOfferCubit() : super(NotDeleteOffer());
  deleteState(int length) {
    int index = length;
    if (index != length) {
      emit(DeleteOffer());
    } else {
      emit(NotDeleteOffer());
    }
  }
}
