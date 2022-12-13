// import 'dart:async';
// import 'package:edevice/data/models/order_model.dart';
// import 'package:edevice/data/repositories/order_repository.dart';
// import 'package:flutter/material.dart';
// import '../data/models/product_model.dart';
//
// class OrderViewModel extends ChangeNotifier {
//   final OrdersRepository ordersRepository;
//
//   OrderViewModel({required this.ordersRepository}) {
//     listenOrders("");
//   }
//
//   late StreamSubscription subscription;
//
//   List<OrderModel> orders = [];
//
//   listenOrders(String categoryId) async {
//     subscription = productRepository
//         .getProducts(categoryId: categoryId)
//         .listen((allProducts) {
//       if(categoryId.isEmpty) productsAdmin=allProducts;
//       print("ALL PRODUCTS LENGHT: ${allProducts.length}");
//       products = allProducts;
//       notifyListeners();
//     });
//   }
//
//   addProduct(ProductModel productModel) =>
//       productRepository.addProduct(productModel: productModel);
//
//   updateProduct(ProductModel productModel) =>
//       productRepository.updateProduct(productModel: productModel);
//
//   deleteProduct(String docId) => productRepository.deleteProduct(docId: docId);
//
//   @override
//   void dispose() {
//     subscription.cancel();
//     super.dispose();
//   }
// }