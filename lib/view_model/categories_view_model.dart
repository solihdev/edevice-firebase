import 'package:edevice/data/models/category_model.dart';
import 'package:edevice/data/repositories/categories_repository.dart';
import 'package:flutter/foundation.dart';

class CategoriesViewModel extends ChangeNotifier {
  final CategoryRepository categoryRepository;

  CategoriesViewModel({
    required this.categoryRepository,
  });

  Stream<List<CategoryModel>> listenCategories() =>
      categoryRepository.getCategories();

  addCategory(CategoryModel categoryModel) =>
      categoryRepository.addCategory(categoryModel: categoryModel);

  updateCategory(CategoryModel categoryModel) =>
      categoryRepository.updateCategory(categoryModel: categoryModel);

  deleteCategory(String docId) =>
      categoryRepository.deleteCategory(docId: docId);
}
