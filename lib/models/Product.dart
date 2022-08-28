class Product {
  final String id;
  final String name;
  final List<String> images;
  final double price;
  final String description;

  Product(
      {required this.id,
      required this.name,
      required this.images,
      required this.price,
      required this.description});
}
