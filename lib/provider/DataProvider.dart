import 'package:add_to_cart/models/Cart.dart';
import 'package:add_to_cart/models/Product.dart';
import 'package:flutter/material.dart';

class DataProvider with ChangeNotifier {
  static List<Cart>? cart = [];

  List<Product> get products => [
        Product(
            id: "1",
            name: "boAt Rockerz 370",
            images: [
              "https://m.media-amazon.com/images/I/61kWB+uzR2L._SX522_.jpg"
            ],
            price: 999,
            description:
                "boAt Rockerz 370 On Ear Bluetooth Headphones with Upto 12 Hours Playtime, Cozy Padded Earcups and Bluetooth v5.0(Buoyant Black)"),
        Product(
            id: "2",
            name: "pTron Studio",
            images: [
              "https://images-eu.ssl-images-amazon.com/images/I/41Du86aSZrL._SX300_SY300_QL70_FMwebp_.jpg"
            ],
            price: 799.00,
            description:
                "pTron Studio Over-Ear Bluetooth 5.0 Wireless Headphones, Hi-Fi Sound with Deep Bass, 12Hrs Playback, Ergonomic & Lightweight Wireless Headset, Soft Cushions Earpads, Aux Port & Mic - (Blue)"),
      ];

// ignore: prefer_final_fields

  List<Cart> get cartItems => cart!;

  void addToCart(cartItem) {
    try {
      cart!.add(cartItem);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  void removeFromCart(cartItem) {
    try {
      cart!.remove(cartItem);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  int cartItemCount = cart!.length;
  int? get count => cartItemCount;

  void incrementCount() {
    cartItemCount++;
    notifyListeners();
  }

  void decrementCount() {
    cartItemCount--;
    notifyListeners();
  }

  static double tot = total();
  double get totalAmount => tot;

  static double total() {
    var amount = 0.0;

    for (var element in cart!) {
      amount += element.price;
    }

    return amount;
  }

  void increaseAmount(amount) {
    tot += amount;
    notifyListeners();
  }

  void decreaseAmount(amount) {
    tot -= amount;
    notifyListeners();
  }
}
