// import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_find_me/core/auth/forget_password/forget_password.dart';
import 'package:go_find_me/core/auth/sign_up/sign_up.dart';
import 'package:go_find_me/modules/layout/layout.dart';
import 'package:go_find_me/utils/mixins/validation_mixins.dart';

class SignInForm extends StatefulWidget {
  SignInForm({Key key}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.name,
              style: TextStyle(color: Colors.white),
              autocorrect: false,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email, color: Colors.white),
                labelText: "Email Address",
                labelStyle: TextStyle(color: Colors.white),
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
            SizedBox(height: 15),
            TextFormField(
              controller: _passwordController,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              autocorrect: false,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: "Password",
                labelStyle: TextStyle(color: Colors.white),
                prefixIcon: Icon(Icons.vpn_key_rounded, color: Colors.white),
              ),
              validator: Validators.isValidPassword,
              onChanged: (password) {
                _passwordController.text = password;
                _passwordController.selection = TextSelection.fromPosition(
                  TextPosition(
                    offset: _passwordController.text.length,
                  ),
                );
              },
            ),
            SizedBox(height: 50),
            SizedBox(
              width: double.infinity,
              child: FloatingActionButton(
                child: Text("LOG IN"),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => AppLayout(),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: Text(
                      "Forgot password?",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ResetPassword(),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 1,
                        width: 50,
                        color: Colors.white10,
                      ),
                      Text(
                        "Or",
                        style: TextStyle(
                          color: Colors.white38,
                          fontSize: 16,
                        ),
                      ),
                      Container(
                        height: 1,
                        width: 50,
                        color: Colors.white10,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => SignUpScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
