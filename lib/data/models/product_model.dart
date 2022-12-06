class ProductModel {
  final String productId;
  final String categoryId;
  final String shopId;
  final List<dynamic> productImages;
  final int price;
  final int count;
  final String description;
  final String createdAt;
  final String currency;

  ProductModel({
    required this.productId,
    required this.categoryId,
    required this.shopId,
    required this.productImages,
    required this.price,
    required this.count,
    required this.description,
    required this.createdAt,
    required this.currency,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productId: json['product_id'] as String? ?? "",
      categoryId: json['category_id'] as String? ?? "",
      shopId: json['shopId'] as String? ?? "",
      productImages: (json["product_images"] as List<dynamic>?) ?? [],
      price: json['price'] as int? ?? 0,
      count: json['count'] as int? ?? 0,
      description: json['description'] as String? ?? "",
      createdAt: json['created_at'] as String? ?? "",
      currency: json['currency'] as String? ?? "",
    );
  }
}