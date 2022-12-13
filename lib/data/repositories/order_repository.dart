import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edevice/data/models/category_model.dart';
import 'package:edevice/data/models/order_model.dart';
import '../../utils/my_utils.dart';

class OrdersRepository {
  final FirebaseFirestore _firestore;

  OrdersRepository({required FirebaseFirestore firebaseFirestore})
      : _firestore = firebaseFirestore;

  Future<void> addOrder({required OrderModel orderModel}) async {
    try {
      DocumentReference newOrder =
      await _firestore.collection("orders").add(orderModel.toJson());
      await _firestore.collection("orders").doc(newOrder.id).update({
        "orderId": newOrder.id,
      });
      MyUtils.getMyToast(message: "Buyurtma muvaffaqiyatli qo'shildi!");
    } on FirebaseException catch (eror) {
      MyUtils.getMyToast(message: eror.message.toString());
    }
  }

  Future<void> deleteOrder({required String docId}) async {
    try {
      await _firestore.collection("orders").doc(docId).delete();
      MyUtils.getMyToast(message: "Order muvaffaqiyatli o'chirildi!");
    } on FirebaseException catch (error) {
      MyUtils.getMyToast(message: error.message.toString());
    }
  }

  Future<void> updateOrder({required OrderModel orderModel}) async {
    try {
      await _firestore
          .collection("orders")
          .doc(orderModel.orderId)
          .update(
        orderModel.toJson(),
      );
      MyUtils.getMyToast(message: "Buyurtma muvaffaqiyatli yangilandi!");
    } on FirebaseException catch (error) {
      MyUtils.getMyToast(message: error.message.toString());
    }
  }

  Stream<List<OrderModel>> getOrders() =>
      _firestore.collection("orders").snapshots().map(
            (event) => event.docs
            .map((doc) => OrderModel.fromJson(doc.data()))
            .toList(),
      );
  Stream<List<OrderModel>> getOrdersByUserId({required String userId}) =>
      _firestore.collection("orders")
          .where("userId",isEqualTo: userId)
          .snapshots()
          .map(
            (event) => event.docs
            .map((doc) => OrderModel.fromJson(doc.data()))
            .toList(),
      );
}
