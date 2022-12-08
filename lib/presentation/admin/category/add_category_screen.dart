import 'package:edevice/data/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../view_model/categories_view_model.dart';

class AddCategoryScreen extends StatefulWidget {
  const AddCategoryScreen({Key? key}) : super(key: key);

  @override
  State<AddCategoryScreen> createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Add Category",
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
      ),
      body: Column(
        children: [
          IconButton(
              onPressed: () {
                CategoryModel categoryModel = CategoryModel(
                  categoryId: "",
                  categoryName: "Muzlatgichlar",
                  description: "yaxshi",
                  imageUrl:
                      "https://freepngimg.com/thumb/refrigerator/5-2-refrigerator-png-picture-thumb.png",
                  createdAt: DateTime.now().toString(),
                );
                Provider.of<CategoriesViewModel>(context, listen: false)
                  ..addCategory(categoryModel)
                  ..updateCategory(categoryModel);
              },
              icon: Icon(Icons.add))
        ],
      ),
    );
  }
}
