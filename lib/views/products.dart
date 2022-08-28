import 'package:add_to_cart/provider/DataProvider.dart';
import 'package:add_to_cart/views/cart.dart';
import 'package:add_to_cart/views/static_widgets/productCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  // List<Product> products = DataProvider().products;
  // int? count = DataProvider().getCount;
  bool? isPresent;
  @override
  Widget build(BuildContext context) {
    final dataProvider = DataProvider();
    var products = dataProvider.products;
    var cart = dataProvider.cartItems;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        foregroundColor: Colors.black,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Products",
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const CartPage();
                      }));
                    },
                    icon: const Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.black,
                    )),
                if (context.watch<DataProvider>().count != 0)
                  Text(
                    "${context.watch<DataProvider>().count}",
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  )
              ],
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
            itemCount: products.length,
            itemBuilder: ((context, index) {
              isPresent = cart
                  .where((element) => element.productId == products[index].id)
                  .isNotEmpty;

              return ProductCard(
                  isPresent: isPresent!, product: products[index]);
            })),
      ),
    );
  }
}
