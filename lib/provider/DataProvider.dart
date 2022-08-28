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
        Product(
            id: "3",
            name: "Noise ColorFit",
            images: [
              'https://m.media-amazon.com/images/I/61epn29QG0L._SL1500_.jpg'
            ],
            price: 1499.00,
            description:
                'Noise ColorFit Pulse Spo2 Smart Watch with 10 days battery life, 60+ Watch Faces, 1.4" Full Touch HD Display Smartwatch, 24*7 Heart Rate Monitor Smart Band, Sleep Monitoring Smart Watches for Men and Women & IP68 Waterproof (Jet Black)'),
        Product(
            id: "4",
            name: "Noise ColorFit Pulse",
            images: [
              "https://images-eu.ssl-images-amazon.com/images/I/41AIJsdZk-L._SX300_SY300_QL70_FMwebp_.jpg"
            ],
            price: 1799.00,
            description:
                'Noise ColorFit Pulse Grand Smart Watch with 1.69"(4.29cm) HD Display, 60 Sports Modes, 150 Watch Faces, Fast Charge, Spo2, Stress, Sleep, Heart Rate Monitoring & IP68 Waterproof (Jet Black)'),
        Product(
            id: "5",
            name: "boAt Airdopes",
            images: [
              "https://m.media-amazon.com/images/I/61o2urRxrcL._SX522_.jpg"
            ],
            price: 1099.00,
            description:
                "boAt Airdopes 121v2 True Wireless Earbuds with Upto 14 Hours Playback, 8MM Drivers, Battery Indicators, Lightweight Earbuds & Multifunction Controls(Active Black)"),
        Product(
            id: "6",
            name: "Jabra Elite 2",
            images: [
              "https://images-eu.ssl-images-amazon.com/images/I/31NI-igp4iL._SX300_SY300_QL70_FMwebp_.jpg"
            ],
            price: 2099.00,
            description:
                "pTron Studio Over-Ear Bluetooth 5.0 Wireless Headphones, Hi-Fi Sound with Deep Bass, 12Hrs Playback, Ergonomic & Lightweight Wireless Headset, Soft Cushions Earpads, Aux Port & Mic - (Blue)"),
        Product(
            id: "7",
            name: "Zebronics",
            images: [
              "https://m.media-amazon.com/images/I/81tioCUVf4L._SL1500_.jpg"
            ],
            price: 599.00,
            description:
                "pTron Studio Over-Ear Bluetooth 5.0 Wireless Headphones, Hi-Fi Sound with Deep Bass, 12Hrs Playback, Ergonomic & Lightweight Wireless Headset, Soft Cushions Earpads, Aux Port & Mic - (Blue)"),
        Product(
            id: "8",
            name: "HP K500F",
            images: [
              "https://m.media-amazon.com/images/I/71f+Iz89ozL._SX522_.jpg"
            ],
            price: 799.00,
            description:
                "pTron Studio Over-Ear Bluetooth 5.0 Wireless Headphones, Hi-Fi Sound with Deep Bass, 12Hrs Playback, Ergonomic & Lightweight Wireless Headset, Soft Cushions Earpads, Aux Port & Mic - (Blue)"),
        Product(
            id: "9",
            name: "HP v236w",
            images: [
              "https://images-eu.ssl-images-amazon.com/images/I/31febYa30qL._SX300_SY300_QL70_FMwebp_.jpg"
            ],
            price: 425.00,
            description:
                "pTron Studio Over-Ear Bluetooth 5.0 Wireless Headphones, Hi-Fi Sound with Deep Bass, 12Hrs Playback, Ergonomic & Lightweight Wireless Headset, Soft Cushions Earpads, Aux Port & Mic - (Blue)"),
        Product(
            id: "10",
            name: "Samsung Duo Plus",
            images: [
              "https://m.media-amazon.com/images/I/81b-Ss6A9DL._SX522_.jpg"
            ],
            price: 1099.00,
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
