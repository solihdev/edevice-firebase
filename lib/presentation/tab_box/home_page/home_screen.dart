import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/models/category_model.dart';
import '../../../view_model/categories_view_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Home Page",
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
      ),
      body: StreamBuilder<List<CategoryModel>>(
        stream: Provider.of<CategoriesViewModel>(context,listen: false).listenCategories(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            List<CategoryModel> categories = snapshot.data!;
            return ListView(
              physics: BouncingScrollPhysics(),
              children: List.generate(
                  categories.length,
                      (index) => ListTile(
                    title: Text(categories[index].categoryName),
                  )),
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