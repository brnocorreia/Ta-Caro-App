import 'package:flutter/material.dart';

import 'package:tacaro_app/shared/utils/app_state.dart';

import 'repositories/update_repository.dart';

class UpdateController extends ChangeNotifier {
  final IUpdateRepository repository;

  AppState state = AppState.empty();
  final formKey = GlobalKey<FormState>();
  String _name = "";
  String _price = "";
  String _date = "";
  UpdateController({required this.repository});

  void onChanged({String? name, String? price, String? date}) {
    _name = name ?? _name;
    _price = price ?? _price;
    _date = date ?? _date;
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

  Future<void> updater() async {
    if (validate()) {
      try {
        update(AppState.loading());
        final response = await repository.updater(
          name: _name,
          price: _price,
          date: _date,
        );
        if (response) {
          update(AppState.success<bool>(response));
        } else {
          throw Exception("Não foi possível atualizar");
        }
      } catch (e) {
        update(AppState.error(e.toString()));
      }
    }
  }
}
