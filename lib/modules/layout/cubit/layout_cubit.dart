import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_find_me/modules/save_me/screens/chat.dart';
import 'package:go_find_me/modules/save_me/screens/home.dart';
import 'package:go_find_me/modules/save_me/screens/notification.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  List<Widget> screens;
  LayoutCubit() : super(LayoutState.initial()) {
    screens = [
      HomeScreen(),
      ChatScreen(),
      NotificationScreen(),
    ];

    changeLayout(screenIndex: 0);
  }

  void changeLayout({@required int screenIndex}) {
    emit(LayoutState.changing(tab: screenIndex, screen: screens[screenIndex]));
  }
}
