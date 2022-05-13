class Product {
  final String productName, description, productImage;
  final double productPrice;

  const Product({
    required this.productName,
    required this.description,
    required this.productImage,
    required this.productPrice
  });

  factory Product.fromJson(Map<String, dynamic> data) {
    return new Product(
      productName: data['productName'],
      description: data['description'],
      productImage: data['productImage'],
      productPrice: data['productPrice'],
    );
  }
}