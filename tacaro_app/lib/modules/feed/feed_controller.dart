// ignore_for_file: unused_element, avoid_print

import 'package:flutter/material.dart';
import 'package:tacaro_app/shared/models/order_model.dart';
import 'package:tacaro_app/shared/models/product_model.dart';
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

  List<OrderModel> get orders => state.when(
        success: (value) => value,
        orElse: () => [],
      );

  double get sumTotal {
    var sum = 0.0;
    for (var item in orders) {
      sum += item.price;
    }
    return sum;
  }

  bool get isGood {
    var isGood = false;
    for (var item in products) {
      if (item.currentPrice < item.lastPrice) {
        isGood = true;
      }
    }
    return isGood;
  }

  List<ProductModel> get products {
    final products = <ProductModel>[];
    for (var item in orders) {
      final product =
          ProductModel(name: item.name, lastPrice: 0, currentPrice: item.price);
      final index =
          products.indexWhere((element) => element.name == product.name);
      if (index != -1) {
        final currentProduct = products[index];
        products[index] = currentProduct.copyWith(lastPrice: item.price);
      } else {
        products.add(product);
      }
    }
    return products;
  }

  double calcChart(List<ProductModel> products) {
    var up = 0.0;
    var total = orders.length;
    for (var item in products) {
      if (item.currentPrice < item.lastPrice) {
        up += 1;
      }
    }
    return up / total;
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
