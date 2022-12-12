import 'package:edevice/data/models/category_model.dart';
import 'package:edevice/data/models/product_model.dart';
import 'package:edevice/utils/my_utils.dart';
import 'package:flutter/material.dart';

class AllProductsScreen extends StatefulWidget {
  const AllProductsScreen({Key? key}) : super(key: key);

  @override
  State<AllProductsScreen> createState() => _AllProductsScreenState();
}

class _AllProductsScreenState extends State<AllProductsScreen> {
  final TextEditingController countController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  List<String> productImages = [
    "https://www.pngitem.com/pimgs/m/183-1831803_laptop-collection-png-transparent-png.png",
    "https://www.pngitem.com/pimgs/m/183-1831803_laptop-collection-png-transparent-png.png",
  ];
  String categoryId = "";
  CategoryModel? categoryModel;
  String createdAt = DateTime.now().toString();
  List<String> currencies = ["USD", "SO'M", "RUBL", "TENGE"];
  String selectedCurrency = "USD";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Add Product Screen",
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              TextField(
                controller: countController,
                keyboardType: TextInputType.number,
                decoration: getInputDecoration(label: "Count"),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: nameController,
                keyboardType: TextInputType.text,
                decoration: getInputDecoration(label: "Product Name"),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: descriptionController,
                keyboardType: TextInputType.text,
                maxLines: 20,
                decoration: getInputDecoration(label: "Description"),
              ),
              const SizedBox(
                height: 20,
              ),
              ExpansionTile(
                title: Text(selectedCurrency.isEmpty
                    ? "Select Currency"
                    : selectedCurrency),
                children: [
                  ...List.generate(
                    currencies.length,
                    (index) => ListTile(
                      title: Text(currencies[index]),
                      onTap: () {
                        setState(() {
                          selectedCurrency = currencies[index];
                        });
                      },
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  categoryModel == null
                      ? "Select Category"
                      : categoryModel!.categoryName,
                ),
              ),
              TextButton(
                onPressed: () {
                  ProductModel productModel = ProductModel(
                    count: int.parse(countController.text),
                    price: int.parse(priceController.text),
                    productImages: productImages,
                    categoryId: categoryId,
                    productId: "",
                    productName: nameController.text,
                    description: descriptionController.text,
                    createdAt: createdAt,
                    currency: selectedCurrency,
                  );
                },
                child: Text("Add Product to Fire Store"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
