import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'sign_in_form.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          // end: Alignment(10.0, 0.0),
          colors: [
            Color(0xff334E71),
            Color(0xff202C44),
          ],
          tileMode: TileMode.repeated, 
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  Positioned(
                    top: 100,
                    left: 50,
                    right: 50,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 70,
                    ),
                  ),
                  Positioned(
                    top: 300,
                    right: 20,
                    left: 20,
                    child: SignInForm(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
