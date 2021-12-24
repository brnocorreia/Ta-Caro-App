// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:tacaro_app/shared/utils/app_state.dart';

class CreateAccountController extends ChangeNotifier {
  AppState state = AppState.empty();
  final formKey = GlobalKey<FormState>();
  String _email = "";
  String _password = "";
  String _name = "";

  void onChanged({String? email, String? password, String? name}) {
    _email = email ?? _email;
    _password = password ?? _password;
    _name = name ?? _name;
  }

  void update(AppState state) {
    this.state = state;
    notifyListeners();
  }

  bool validate() {
    final form = formKey.currentState!;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Future<void> create() async {
    if (validate()) {
      try {
        update(AppState.loading());
        await Future.delayed(Duration(seconds: 3));
        update(AppState.success<String>("Conta criada"));
      } catch (e) {
        update(AppState.error("Não foi possível criar a conta"));
      }
    }
  }
}
