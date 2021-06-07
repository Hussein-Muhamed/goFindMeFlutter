import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'cubit/layout_cubit.dart';

class AppLayout extends StatelessWidget {
  AppLayout({Key key}) : super(key: key);

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit(),
      child: BlocBuilder<LayoutCubit, LayoutState>(
        builder: (context, state) {
          return Scaffold(
            key: _scaffoldKey,
            body: state.screen,
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: state.tab,
              onTap: (curretIndex) {
                BlocProvider.of<LayoutCubit>(context)
                    .changeLayout(screenIndex: curretIndex);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  // ignore: deprecated_member_use
                  title: SizedBox.shrink(),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.chat),
                  // ignore: deprecated_member_use
                  title: SizedBox.shrink(),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.notifications),
                  // ignore: deprecated_member_use
                  title: SizedBox.shrink(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
