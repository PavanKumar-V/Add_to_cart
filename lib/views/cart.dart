import 'package:add_to_cart/provider/DataProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  var cartItems;
  double total = 0;

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataProvider>(context);
    cartItems = dataProvider.cartItems;
    for (var ele in cartItems) {
      total += ele.price;
    }
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          leading: const BackButton(
            color: Colors.black,
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text(
            "My Cart",
            style: TextStyle(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: cartItems.isEmpty
              ? const Text("Your Cart is Empty")
              : ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Card(
                        color: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(14.0),
                                  child: Image.network(
                                    cartItems[index].image,
                                    height: 100.0,
                                    width: 100.0,
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    cartItems[index].name,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        height: 1.8),
                                  ),
                                  Text(
                                    "₹ ${cartItems[index].price * cartItems[index].quantity}",
                                    style: const TextStyle(
                                        fontSize: 16, height: 1.2),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          if (cartItems[index].quantity > 1) {
                                            setState(() {
                                              cartItems[index].quantity--;
                                              context
                                                  .read<DataProvider>()
                                                  .decreaseAmount(
                                                      cartItems[index].price);
                                            });
                                          }
                                        },
                                        child: const CircleAvatar(
                                          radius: 15,
                                          backgroundColor: Color(0xFFBDCECB),
                                          child: Icon(
                                            Icons.remove,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text(
                                          "${cartItems[index].quantity}",
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            cartItems[index].quantity++;
                                            context
                                                .read<DataProvider>()
                                                .increaseAmount(
                                                    cartItems[index].price);
                                          });
                                        },
                                        child: CircleAvatar(
                                          radius: 15,
                                          backgroundColor:
                                              Theme.of(context).primaryColor,
                                          child: const Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              const Spacer(),
                              InkWell(
                                onTap: () {
                                  context.read<DataProvider>().decreaseAmount(
                                      cartItems[index].price *
                                          cartItems[index].quantity);
                                  context
                                      .read<DataProvider>()
                                      .removeFromCart(cartItems[index]);
                                  context.read<DataProvider>().decrementCount();
                                },
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.2),
                                  child: Icon(
                                    Icons.delete_outline_rounded,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SizedBox(
            height: 130,
            child: Column(
              children: [
                Row(
                  children: [
                    const Text(
                      "Item Count",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    Text(" ${context.watch<DataProvider>().count}")
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const Text(
                      "Total",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    Text(
                      " ${context.watch<DataProvider>().totalAmount}",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const Spacer(),
                Material(
                  color: Colors.transparent,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).canvasColor,
                        shape: const StadiumBorder(),
                        elevation: 0),
                    onPressed: () {},
                    child: const SizedBox(
                      height: kToolbarHeight,
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          'Checkout',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
