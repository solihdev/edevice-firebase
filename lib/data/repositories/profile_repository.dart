import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edevice/data/models/user_model.dart';
import 'package:edevice/utils/my_utils.dart';

class ProfileRepository {
  final FirebaseFirestore _firestore;

  ProfileRepository({required FirebaseFirestore firebaseFirestore})
      : _firestore = firebaseFirestore;

  Future<void> addUser({required UserModel userModel}) async {
    try {
      await _firestore.collection("users").add(userModel.toJson());
      MyUtils.getMyToast(message: "User muvaffaqiyatli qo'shildi!");
    } on FirebaseException catch (er) {
      MyUtils.getMyToast(message: er.message.toString());
    }
  }

  Future<void> updateUsersFCMToken({required String fcmToken, required String docId}) async {
    try {
      await _firestore.collection("users").doc(docId).update({
        "fcm_token":fcmToken,
      });
    } on FirebaseException catch (er) {
      MyUtils.getMyToast(message: er.message.toString());
    }
  }
}