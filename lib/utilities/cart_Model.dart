import 'package:flutter/material.dart';
import 'product.dart';

class CartModel extends ChangeNotifier {
  final List<Product> _cartItems = [];

  // Immutable list so the UI cannot directly modify the internal list
  List<Product> get cartItems => List.unmodifiable(_cartItems);

  // Add a product to the cart
  void addToCart(Product product) {
    _cartItems.add(product);
    notifyListeners();
  }

  // Remove a product (the first match)
  void removeFromCart(Product product) {
    _cartItems.remove(product);
    notifyListeners();
  }

  // Clear the cart
  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}