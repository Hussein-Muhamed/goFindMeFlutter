import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_find_me/utils/mixins/validation_mixins.dart';

class ResetPassword extends StatelessWidget {
  ResetPassword({Key key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height - 100,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 400,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 50.0,
                          left: 0.0,
                          child: IconButton(
                            icon: Icon(Icons.arrow_back),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        Positioned(
                          top: 100,
                          left: 0.0,
                          right: 0.0,
                          child: CircleAvatar(
                            backgroundColor: Colors.black,
                            radius: 70,
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          left: 10.0,
                          right: 10.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Forgot password?",
                                style: TextStyle(
                                  fontSize: 32,
                                ),
                              ),
                              SizedBox(height: 15),
                              Text(
                                "Enter the email address associated with your account",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.name,
                    autocorrect: false,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.email, color: Colors.black),
                      labelStyle: TextStyle(color: Colors.black),
                      labelText: "Email Address",
                    ),
                    validator: Validators.isValidEmail,
                    onChanged: (email) {
                      _emailController.text = email.trim();
                      _emailController.selection = TextSelection.fromPosition(
                        TextPosition(
                          offset: _emailController.text.length,
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: FloatingActionButton(
                      child: Text(
                        "RESET PASSWORD",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      backgroundColor: Color(0xff202C44),
                      onPressed: () {},
                    ),
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
