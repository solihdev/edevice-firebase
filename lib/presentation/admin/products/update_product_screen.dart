import 'package:flutter/material.dart';

import '../../../data/models/product_model.dart';

class UpdateProductScreen extends StatefulWidget {
  const UpdateProductScreen({Key? key, required this.productModel}) : super(key: key);

  final ProductModel productModel;

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
