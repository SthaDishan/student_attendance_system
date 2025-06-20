import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project/controllers/signup.dart';

class addStudent extends StatefulWidget {
  const addStudent({super.key});

  @override
  State<addStudent> createState() => _addStudentState();
}

class _addStudentState extends State<addStudent> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isObscure = true;
  final phoneNumberEditingController = TextEditingController();
  final reg_user ru = reg_user();

  void _submit() {
    var parsedvalue = int.parse(phoneNumberEditingController.text);
    try {
      ru.signUp(emailController.text, passwordController.text,
          usernameController.text, parsedvalue);
    } finally {
      clear_text();
    }
  }

  void clear_text() {
    usernameController.clear();
    emailController.clear();
    passwordController.clear();
    phoneNumberEditingController.clear();
  }

  String? validateName(String value) {
    RegExp regex = RegExp(r'^.{3,}$');
    if (value.isEmpty) {
      return ("Name cannot be Empty");
    }
    if (!regex.hasMatch(value)) {
      return ("Enter Valid name(Min. 3 Character)");
    }
    return null;
  }

  String? validateEmail(String value) {
    if (value.isEmpty) {
      return ("Please Enter Your Email");
    }
    // reg expression for email validation
    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
      return ("Please Enter a valid email");
    }
    return null;
  }

  String? validatePassword(String value) {
    RegExp regex = RegExp(r'^.{6,}$');
    if (value.isEmpty) {
      return ("Password is required for register");
    }
    if (!regex.hasMatch(value)) {
      return ("Enter Valid Password(Min. 6 Character)");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: Text("Register Student"), backgroundColor: Colors.grey),
      body: Container(
         decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/2.jpg"),
              fit: BoxFit.fill,
            ),
          ),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Container(
                  height: 200,
                  child: Icon(
                    Icons.person,
                    size: 150,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: TextFormField(
                controller: usernameController,
                onChanged: null,
                autocorrect: false,
                cursorColor: const Color(0xff000000),
                decoration: InputDecoration(
                  errorText: validateName(usernameController.text),
                  icon: Icon(
                    Icons.email,
                    color: Color(0xff6dd5fa),
                  ),
                  hintText: "Name",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: TextFormField(
                controller: phoneNumberEditingController,
                keyboardType: TextInputType.emailAddress,
                onChanged: null,
                autocorrect: false,
                cursorColor: const Color(0xff000000),
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.email,
                    color: Color(0xff6dd5fa),
                  ),
                  hintText: "Phone Number",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                onChanged: null,
                autocorrect: false,
                cursorColor: const Color(0xff000000),
                decoration: InputDecoration(
                  errorText: validateEmail(emailController.text),
                  icon: Icon(
                    Icons.email,
                    color: Color(0xff6dd5fa),
                  ),
                  hintText: "Email",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: TextFormField(
                controller: passwordController,
                obscureText: _isObscure,
                onChanged: null,
                autocorrect: false,
                cursorColor: const Color(0xff000000),
                decoration: InputDecoration(
                  errorText: validatePassword(passwordController.text),
                  icon: Icon(
                    Icons.email,
                    color: Color(0xff6dd5fa),
                  ),
                  hintText: "Password",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 30, 0, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    flex: 1,
                    child: MaterialButton(
                      onPressed: () {
                        _submit();
                        log(
                          'button pressed',
                        );
                      },
                      color: Color(0xff353535),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      padding: EdgeInsets.all(16),
                      child: Text(
                        "Register Student",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      textColor: Color(0xffffffff),
                      height: 40,
                      minWidth: 140,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
