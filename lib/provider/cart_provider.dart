import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart%20';
import '../model/cart_item.dart';
import '../model/product.dart';

class CartProvider extends ChangeNotifier {
  final List<CartItem> _cartItems = [];
  List<CartItem> get cartItems => _cartItems;



  Future userLogin() async{
    String email = 'don@gmail.com';
    String password = 'ewedon';
    var url = 'https://fakestoreapi.com/users';
    var data = {'email': email, 'password' : password};
     await http.post(Uri.parse(url),
        body: json.encode(data[email]))
        .then((value)
    {
      print(value.body.toString());
       notifyListeners();
    }).catchError((e)
        {
          print(e.toString());
          notifyListeners();
        }
    );


  }




  void addToCart(Product product, int quantity,) {
    var existingCartItem = _cartItems.firstWhereOrNull(
      (item) => item.product.id == product.id,
    );

    if (existingCartItem != null) {
      existingCartItem.quantity += quantity;
    } else {
      _cartItems.add(CartItem(product: product, quantity: quantity));
    }

    notifyListeners();
  }

  int getProductQuantity(int productId) {
    int quantity = 0;
    for (CartItem item in _cartItems) {
      if (item.product.id == productId) {
        quantity += item.quantity;
      }
    }
    return quantity;
  }

  int get cartCount {
    return _cartItems.fold(0, (sum, item) => sum + item.quantity);
  }

  double get totalPrice {
    return _cartItems.fold(
        0.0, (sum, item) => sum + (item.product.price! * item.quantity));
  }

  void updateCartItemQuantity(int index, int newQuantity) {
    if (index >= 0 && index < _cartItems.length) {
      _cartItems[index].quantity = newQuantity;
      notifyListeners();
    }
  }

  void increaseCartItemQuantity(int index) {
    if (index >= 0 && index < _cartItems.length) {
      _cartItems[index].quantity++;
      notifyListeners();
    }
  }

  void decreaseCartItemQuantity(int index) {
    if (index >= 0 && index < _cartItems.length) {
      if (_cartItems[index].quantity > 1) {
        _cartItems[index].quantity--;
        notifyListeners();
      } else {
        // If the quantity is 1, remove the item from the cart
        _cartItems.removeAt(index);
        notifyListeners();
      }
    }
  }

  void removeCartItem(int index) {
    if (index >= 0 && index < _cartItems.length) {
      _cartItems.removeAt(index);
      notifyListeners();
    }
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

  List<CartItem> getCartItemsList() {
    return List<CartItem>.from(_cartItems);
  }
}
