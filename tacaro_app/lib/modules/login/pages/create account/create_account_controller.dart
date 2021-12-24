// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';

class CreateAccountController {

  final formKey = GlobalKey<FormState>();
  String _email = "";
  String _password = "";
  String _name = "";

  void onChanged({String? email, String? password, String? name}) {

    _email = email ?? _email;
    _password = password ?? _password;
    _name = name ?? _name;

    // ignore: avoid_print
    print("email: $_email | password: $_password | name: $_name");

  }

  bool validate(){
    final form = formKey.currentState!;
    if(form.validate()){
      form.save();
      return true;
    }
      return false;
  }

  void create(){
    if(validate()){
      
    }
  }

}