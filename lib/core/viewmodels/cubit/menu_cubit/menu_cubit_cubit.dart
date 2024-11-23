import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mazaya/core/viewmodels/cubit/menu_cubit/menu_cubit_state.dart';

class MenuCubitCubit extends Cubit<MenuCubitState> {
  MenuCubitCubit() : super(DontShowMenu());

  showMenu({required bool show}) {
    if (show) {
      emit(ShowMenu());
    } else {
      emit(DontShowMenu());
    }
  }
}
