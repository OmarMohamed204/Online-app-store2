import 'package:flutter/material.dart';
import 'package:loginpages/model/notification.dart';

class Cart with ChangeNotifier {
  List selectedItems = [];

  List<int> quantities = [];

  // ignore: non_constant_identifier_names
  List notifications_add = [];

  double pricee = 0;

  // =========================
  // ADD
  // =========================

  void add(dynamic product) {
    final index = selectedItems.indexWhere((item) => item.name == product.name);

    if (index != -1) {
      quantities[index]++;
    } else {
      selectedItems.add(product);
      quantities.add(1);
    }

    notifications_add.insert(
      0,
      NotificationModel(
        title: 'Product Added 🛒',
        message: '${product.name}  was added to your cart',
        time: 'Just now',
      ),
    );

    pricee += double.parse(product.price).round();

    notifyListeners();
  }

  // =========================
  // REMOVE
  // =========================

  void remove(dynamic product) {
    final index = selectedItems.indexWhere((item) => item.name == product.name);

    if (index == -1) return;

    if (quantities[index] > 1) {
      quantities[index]--;
    } else {
      selectedItems.removeAt(index);
      quantities.removeAt(index);
    }

    pricee -= double.parse(product.price).round();

    if (pricee < 0) {
      pricee = 0;
    }

    notifyListeners();
  }

  // =========================
  // CLEAR NOTIFICATIONS
  // =========================

  void clearNotifications() {
    notifications_add.clear();

    notifyListeners();
  }

  // =========================
  // ITEM COUNT
  // =========================

  // ignore: strict_top_level_inference
  get itemCount {
    return selectedItems.length;
  }

  // =========================
  // TOTAL QUANTITY
  // =========================

  // int get totalQuantity {
  //   int total = 0;

  //   for (int quantity in quantities) {
  //     total += quantity;
  //   }

  //   return total;
  // }
}
