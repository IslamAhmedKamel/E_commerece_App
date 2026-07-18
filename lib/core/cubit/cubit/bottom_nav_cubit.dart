import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bottom_nav_state.dart';

class BottomNavCubit extends Cubit<BottomNavState> {
  BottomNavCubit() : super(BottomNavInitialHomeView());
  int currentIndex = 0;
  void onTap({required int currenIndex}) {
    if (currenIndex == 0) {
      emit(BottomNavInitialHomeView());
    }
    if (currenIndex == 1) {
      emit(BottomNavFavoriteView());
    }

    if (currenIndex == 2) {
      emit(BottomNavCartView());
    }

    if (currenIndex == 3) {
      emit(BottomNavSettingsView());
    }
  }
}
