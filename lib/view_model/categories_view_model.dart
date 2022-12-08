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
}
