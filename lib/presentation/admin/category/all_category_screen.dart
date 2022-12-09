import 'package:edevice/presentation/admin/category/update_category_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/models/category_model.dart';
import '../../../view_model/categories_view_model.dart';

class AllCategoriesScreen extends StatefulWidget {
  const AllCategoriesScreen({Key? key}) : super(key: key);

  @override
  State<AllCategoriesScreen> createState() => _AllCategoriesScreenState();
}

class _AllCategoriesScreenState extends State<AllCategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Categories Admin",
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
        actions: [
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
                    .addCategory(categoryModel);
              },
              icon: const Icon(
                Icons.add,
                color: Colors.black,
              ))
        ],
      ),
      body: StreamBuilder<List<CategoryModel>>(
        stream: Provider.of<CategoriesViewModel>(context, listen: false)
            .listenCategories(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            List<CategoryModel> categories = snapshot.data!;
            return ListView(
              children: List.generate(
                  categories.length,
                  (index){
                    CategoryModel category=categories[index];
                    return ListTile(
                      title: Text(category.categoryName),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            UpdateCategoryScreen(
                                              categoryModel:
                                              category,
                                            )),
                                  );
                                },
                                icon: const Icon(Icons.edit)),
                            IconButton(
                                onPressed: () {
                                  Provider.of<CategoriesViewModel>(context,
                                      listen: false)
                                      .deleteCategory(
                                      category.categoryId);
                                },
                                icon: const Icon(Icons.delete)),
                          ],
                        ),
                      ),
                    );
                  }),
            );
          } else {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
        },
      ),
    );
  }
}
