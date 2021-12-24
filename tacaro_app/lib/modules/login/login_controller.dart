// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';

class LoginController {

  final formKey = GlobalKey<FormState>();
  String _email = "";
  String _password = "";

  void onChanged({String? email, String? password}) {

    _email = email ?? _email;
    _password = password ?? _password;

    // ignore: avoid_print
    print("email: $_email | password: $_password");

  }

  bool validate(){
    final form = formKey.currentState!;
    if(form.validate()){
      form.save();
      return true;
    }
      return false;
  }

  void login(){
    if(validate()){

    }
  }

}