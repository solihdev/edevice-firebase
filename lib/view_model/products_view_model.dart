import 'dart:async';
import 'package:edevice/data/repositories/product_repository.dart';
import 'package:flutter/cupertino.dart';
import '../data/models/product_model.dart';

class ProductViewModel extends ChangeNotifier {
  final ProductRepository productRepositroy;

  ProductViewModel({required this.productRepositroy});

  late StreamSubscription subscription;

  List<ProductModel> products = [];

  listenProducts() async {
    subscription = productRepositroy.getProducts().listen((allProducts) {
      products = allProducts;
      notifyListeners();
    })
      ..onError((error) {})
      ..onData((data) {});
  }

  addProduct(ProductModel productModel) =>
      productRepositroy.addProduct(productModel: productModel);

  updateProduct(ProductModel productModel) =>
      productRepositroy.updateProduct(productModel: productModel);

  deleteProduct(String docId) => productRepositroy.deleteProduct(docId: docId);

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }
}
