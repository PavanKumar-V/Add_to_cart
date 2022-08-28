class Cart {
  final String productId;
  final String name;
  double price;
  int quantity;
  final String image;

  Cart(
      {required this.productId,
      required this.name,
      required this.price,
      required this.quantity,
      required this.image});
}
