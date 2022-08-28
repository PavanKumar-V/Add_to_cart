import 'package:add_to_cart/models/Cart.dart';
import 'package:add_to_cart/models/Product.dart';
import 'package:add_to_cart/provider/DataProvider.dart';
import 'package:add_to_cart/views/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatefulWidget {
  bool isPresent;
  Product product;
  ProductCard({Key? key, required this.isPresent, required this.product})
      : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          elevation: 2,
          color: Colors.white,
          child: ListTile(
            contentPadding: const EdgeInsets.all(8),
            // tileColor: Colors.white,
            leading: Image.network(
              widget.product.images[0],
              fit: BoxFit.fitWidth,
            ),
            title: Text(
              widget.product.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text("₹ ${widget.product.price}"),
            trailing: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    primary: widget.isPresent
                        ? Colors.green
                        : Theme.of(context).primaryColor,
                    shape: const StadiumBorder(),
                    elevation: 0),
                onPressed: () {
                  print(widget.isPresent);
                  if (widget.isPresent) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const CartPage()));
                  } else {
                    setState(() {
                      widget.isPresent = true;
                    });
                    context.read<DataProvider>().addToCart(Cart(
                        productId: widget.product.id,
                        name: widget.product.name,
                        price: widget.product.price,
                        quantity: 1,
                        image: widget.product.images[0]));
                    context.read<DataProvider>().incrementCount();
                    context
                        .read<DataProvider>()
                        .increaseAmount(widget.product.price);
                  }
                },
                icon: Icon(
                  widget.isPresent
                      ? Icons.done
                      : Icons.add_shopping_cart_outlined,
                  size: 18,
                ),
                label: const Text("cart")),
          ),
        ));
  }
}
