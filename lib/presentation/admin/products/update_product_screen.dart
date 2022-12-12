import 'package:flutter/material.dart';
import '../../../data/models/category_model.dart';
import '../../../data/models/product_model.dart';

class UpdateProductScreen extends StatefulWidget {
  const UpdateProductScreen({Key? key, required this.productModel}) : super(key: key);

  final ProductModel productModel;

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {

  final TextEditingController countController=TextEditingController();
  final TextEditingController priceController=TextEditingController();
  final TextEditingController nameController=TextEditingController();
  final TextEditingController descriptionController=TextEditingController();
  List<String> productImages = [
    "https://www.pngitem.com/pimgs/m/183-1831803_laptop-collection-png-transparent-png.png",
    "https://www.pngitem.com/pimgs/m/183-1831803_laptop-collection-png-transparent-png.png",
  ];
  String categoryId = "";
  CategoryModel? categoryModel;
  List<String> currencies = ["USD", "SO'M", "RUBL", "TENGE"];
  String selectedCurrency = "USD";

  @override
  void initState() {
    countController.text=widget.productModel.count.toString();
    priceController.text=widget.productModel.price.toString();
    nameController.text=widget.productModel.productName;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Update Product Screen",
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
      ),
    );
  }
}
