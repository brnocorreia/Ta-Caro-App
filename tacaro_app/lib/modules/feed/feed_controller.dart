// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:tacaro_app/shared/models/order_model.dart';
import 'package:tacaro_app/shared/utils/app_state.dart';
import 'repositories/feed_repository.dart';

class FeedController extends ChangeNotifier {
  final IFeedRepository repository;

  AppState state = AppState.empty();

  FeedController({required this.repository});

  void update(AppState state) {
    this.state = state;
    notifyListeners();
  }

  Future<void> getData() async {
    try {
      update(AppState.loading());
      final response = await repository.getAll();
      print(response);
      update(AppState.success<List<OrderModel>>(response));
    } catch (e) {
      update(AppState.error(e.toString()));
    }
  }
}
