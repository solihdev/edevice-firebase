import 'package:edevice/data/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../view_model/categories_view_model.dart';

class UpdateCategoryScreen extends StatefulWidget {
  const UpdateCategoryScreen({Key? key,required this.categoryModel}) : super(key: key);

  final CategoryModel categoryModel;

  @override
  State<UpdateCategoryScreen> createState() => _UpdateCategoryScreenState();
}

class _UpdateCategoryScreenState extends State<UpdateCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Update Category",
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
      ),
      body: Column(
        children: [
          IconButton(
            onPressed: () {
              CategoryModel categoryModel = CategoryModel(
                categoryId: widget.categoryModel.categoryId,
                categoryName: "Muzlat",
                description: widget.categoryModel.description,
                imageUrl: widget.categoryModel.imageUrl,
                createdAt: widget.categoryModel.createdAt,
              );
              Provider.of<CategoriesViewModel>(context, listen: false)
                  .updateCategory(categoryModel);
            },
            icon: const Icon(Icons.edit),
          )
        ],
      ),
    );
  }
}
