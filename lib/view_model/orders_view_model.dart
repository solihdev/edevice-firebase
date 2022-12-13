import 'dart:async';
import 'package:edevice/data/models/order_model.dart';
import 'package:edevice/data/repositories/order_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class OrderViewModel extends ChangeNotifier {

  final OrdersRepository ordersRepository;

  OrderViewModel({required this.ordersRepository}) {
    listenOrders(FirebaseAuth.instance.currentUser!.uid);
  }

  late StreamSubscription subscription;

  List<OrderModel> userOrders = [];

  listenOrders(String userId) async {
    subscription = ordersRepository
        .getOrdersByUserId(userId: userId)
        .listen((orders) {
      userOrders = orders;
      notifyListeners();
    });
  }

  addOrder(OrderModel orderModel) =>
      ordersRepository.addOrder(orderModel: orderModel);

  addOrderInExsist({required String productId,required int count}){
    OrderModel orderModel=userOrders.firstWhere((element) => element.orderId==productId);
    int currentCount=orderModel.count;
    ordersRepository.updateOrder(orderModel: orderModel.copyWith(count: currentCount+count));
  }

  updateOrder(OrderModel orderModel) =>
      ordersRepository.updateOrder(orderModel: orderModel);

  deleteOrder(String docId) => ordersRepository.deleteOrder(docId: docId);

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }
}