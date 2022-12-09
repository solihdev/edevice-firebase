import 'package:edevice/data/models/product_model.dart';
import 'package:edevice/view_model/products_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllProductsScreen extends StatefulWidget {
  const AllProductsScreen({Key? key}) : super(key: key);

  @override
  State<AllProductsScreen> createState() => _AllProductsScreenState();
}

class _AllProductsScreenState extends State<AllProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Products Admin",
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
      ),
      body: Consumer<ProductViewModel>(
        builder: (context, productViewModel, child){
          return ListView(
            children: [
              // List.generate(productViewModel.products.length, (index){})
            ],
          );
        }),
      );
  }
}
