import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edevice/data/models/category_model.dart';

class CategoryRepository {
  final FirebaseFirestore _firestore;

  CategoryRepository({required FirebaseFirestore firebaseFirestore})
      : _firestore = firebaseFirestore;

  Stream<List<CategoryModel>> getCategories() =>
      _firestore.collection("categories").snapshots().map(
            (event) => event.docs
                .map((doc) => CategoryModel.fromJson(doc.data()))
                .toList(),
          );
}
