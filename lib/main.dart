import 'package:add_to_cart/provider/DataProvider.dart';
import 'package:add_to_cart/views/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => DataProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: const Color(0xFFE55B37),
          hintColor: const Color(0xFFF9CBB6),
          canvasColor: const Color(0xFF0B0B0B),
          backgroundColor: const Color(0xFFEBF0F3),
        ),
        debugShowCheckedModeBanner: false,
        home: const ProductsPage());
  }
}
