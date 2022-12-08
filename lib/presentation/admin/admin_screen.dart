import 'package:edevice/presentation/admin/products/all_products_screen.dart';
import 'package:flutter/material.dart';
import 'category/all_category_screen.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Admin Page",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AllCategoriesScreen()),
              );
            },
            title: Text("Categories"),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AllProductsScreen()),
              );
            },
            title: Text("Products"),
          )
        ],
      ),
    );
  }
}
