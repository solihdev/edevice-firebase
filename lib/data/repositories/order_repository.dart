import 'package:cloud_firestore/cloud_firestore.dart';

class OrderRepository{
  final FirebaseFirestore _firestore;

  OrderRepository({required FirebaseFirestore firebaseFirestore})
      : _firestore = firebaseFirestore;
}