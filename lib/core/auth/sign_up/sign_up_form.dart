// import 'package:bloc_provider/bloc_provider.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_find_me/utils/mixins/validation_mixins.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class SignUpForm extends StatefulWidget {
  SignUpForm({Key key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.35,
                  child: TextFormField(
                    controller: _firstNameController,
                    keyboardType: TextInputType.name,
                    autocorrect: false,
                    decoration: InputDecoration(
                      prefixIcon:
                          Icon(Icons.person_rounded, color: Colors.black),
                      labelStyle: TextStyle(color: Colors.black),
                      labelText: "Name",
                    ),
                    validator: Validators.isValidUserName,
                    onChanged: (name) {
                      _firstNameController.text = name;
                      _firstNameController.selection =
                          TextSelection.fromPosition(
                        TextPosition(
                          offset: _firstNameController.text.length,
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.35,
                  child: TextFormField(
                    controller: _lastNameController,
                    keyboardType: TextInputType.name,
                    autocorrect: false,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.black),
                      labelText: "Last Name",
                    ),
                    validator: Validators.isValidUserName,
                    onChanged: (name) {
                      _lastNameController.text = name;
                      _lastNameController.selection =
                          TextSelection.fromPosition(
                        TextPosition(
                          offset: _lastNameController.text.length,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.name,
              // style: TextStyle(color: Colors.white),
              autocorrect: false,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email, color: Colors.black),
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
            SizedBox(height: 15),
            TextFormField(
              controller: _passwordController,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              autocorrect: false,
              decoration: InputDecoration(
                labelText: "Password",
                labelStyle: TextStyle(color: Colors.black),
                prefixIcon: Icon(Icons.https, color: Colors.black),
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
            SizedBox(height: 15),
            TextFormField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              autocorrect: false,
              decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.black),
                prefix: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "+20",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                prefixIcon: Icon(
                  Icons.phone_android_rounded,
                  color: Colors.black,
                ),
                labelText: "Phone Number",
              ),
              validator: Validators.isValidPhoneNumber,
              onChanged: (phone) {
                _phoneController.text = phone;
                _phoneController.selection = TextSelection.fromPosition(
                  TextPosition(
                    offset: _phoneController.text.length,
                  ),
                );
              },
            ),
            SizedBox(height: 15),
            SizedBox(
              height: 52,
              child: DropdownSearch(
                mode: Mode.MENU,
                maxHeight: 120,
                showSelectedItem: true,
                dropdownSearchDecoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.black),
                  suffixIcon: Icon(
                    Icons.arrow_drop_down_rounded,
                    size: 30,
                    color: Colors.black,
                  ),
                  isDense: true,
                  prefixIcon: Icon(
                    FontAwesomeIcons.transgender,
                    color: Colors.black,
                  ),
                  labelText: "Gender",
                ),
                dropDownButton: SizedBox.shrink(),
                items: ["Male", "Female"],
                hint: "gender in menu mode",
                onChanged: print,
                selectedItem: "Male",
              ),
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: _dateController,
              keyboardType: TextInputType.datetime,
              autocorrect: false,
              decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.black),
                prefixIcon: Icon(
                  Icons.date_range,
                  color: Colors.black,
                ),
                labelText: "Birthday",
              ),
              onTap: () {
                _selectDate(context);
              },
            ),
            SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: FloatingActionButton(
                child: Text(
                  "SIGN UP",
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
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );
    if (picked != null)
      setState(() {
        _dateController.text = DateFormat('MMM d, yyyy').format(picked);
      });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
