class OrderModel {
  final String orderId;
  final String productId;
  final int count;
  final int totalPrice;
  final String createdAt;
  final String userId;
  final String orderStatus;

  OrderModel({
    required this.orderId,
    required this.productId,
    required this.count,
    required this.totalPrice,
    required this.createdAt,
    required this.userId,
    required this.orderStatus
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      orderId: json['order_id'] as String? ?? "",
      productId: json['product_id'] as String? ?? "",
      count: json['count'] as int? ?? 0,
      totalPrice: json['total_price'] as int? ?? 0,
      createdAt: json['created_at'] as String? ?? "",
      userId: json['user_id'] as String? ?? "",
      orderStatus: json['order_status'] as String? ?? "",
    );
  }
}