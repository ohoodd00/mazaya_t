import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mazaya/core/viewmodels/cubit/delete_contact_cubit/delete_contact_state.dart';

class DeleteContactCubit extends Cubit<DeleteContactState> {
  DeleteContactCubit() : super(NotDelete());

  stateDelete(int length) {
    int index = length;
    if (length != index) {
      emit(Delete());
    } else {
      emit(NotDelete());
    }
  }
}
