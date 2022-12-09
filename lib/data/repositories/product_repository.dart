import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edevice/data/models/product_model.dart';
import 'package:edevice/utils/my_utils.dart';

class ProductRepository {
  final FirebaseFirestore _firestore;

  ProductRepository({required FirebaseFirestore firebaseFirestore})
      : _firestore = firebaseFirestore;

  Future<void> addProduct({required ProductModel productModel}) async {
    try {
      var newProduct =
          await _firestore.collection("products").add(productModel.toJson());
      await _firestore.collection("products").doc(newProduct.id).update({
        "productId": newProduct.id,
      });
      MyUtils.getMyToast(message: "Maxsulot muvaffaqiyatli qo'shildi!");
    } on FirebaseException catch (eror) {
      MyUtils.getMyToast(message: eror.message.toString());
    }
  }

  Future<void> deleteProduct({required String docId}) async {
    try {
      await _firestore.collection("products").doc(docId).delete();
      MyUtils.getMyToast(message: "Maxsulot muvaffaqiyatli o'chirildi!");
    } on FirebaseException catch (error) {
      MyUtils.getMyToast(message: error.message.toString());
    }
  }

  Future<void> updateProduct({required ProductModel productModel}) async {
    try {
      await _firestore
          .collection("products")
          .doc(productModel.productId)
          .update(
            productModel.toJson(),
          );
      MyUtils.getMyToast(message: "Maxsulot muvaffaqiyatli o'chirildi!");
    } on FirebaseException catch (error) {
      MyUtils.getMyToast(message: error.message.toString());
    }
  }

  Stream<List<ProductModel>> getProducts({required String categoryId}) async* {
    if (categoryId.isEmpty) {
      yield* _firestore.collection("products").snapshots().map(
            (querySnapshot) => querySnapshot.docs
            .map((doc) => ProductModel.fromJson(doc.data()))
            .toList(),
      );
    } else {
      yield* _firestore
          .collection("products")
          .where("categoryId", isEqualTo: categoryId)
          .snapshots()
          .map(
            (querySnapshot) => querySnapshot.docs
            .map((doc) => ProductModel.fromJson(doc.data()))
            .toList(),
      );
    }
  }
}
