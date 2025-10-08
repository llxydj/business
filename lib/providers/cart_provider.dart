import 'package:flutter/material.dart';

// CartProvider - manages shopping cart state
class CartProvider extends ChangeNotifier {
  final List<String> _cartItems = [];

  List<String> get cartItems => _cartItems;

  int get count => _cartItems.length;

  void addItem(String item) {
    _cartItems.add(item);
    notifyListeners();
  }

  void removeItem(String item) {
    _cartItems.remove(item);
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
