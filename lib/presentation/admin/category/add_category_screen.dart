import 'package:edevice/data/models/category_model.dart';
import 'package:edevice/utils/my_utils.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../../data/services/file_uploader.dart';
import '../../../view_model/categories_view_model.dart';

class AddCategoryScreen extends StatefulWidget {
  const AddCategoryScreen({Key? key}) : super(key: key);

  @override
  State<AddCategoryScreen> createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  final ImagePicker _picker = ImagePicker();
  String imageUrl = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Add Category",
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
      ),
      body: Column(
        children: [
          IconButton(
              onPressed: () {
                if (imageUrl.isEmpty) {
                  MyUtils.getMyToast(message: "Image tanla!!!");
                  return;
                }
                CategoryModel categoryModel = CategoryModel(
                  categoryId: "",
                  categoryName: "Televizor",
                  description: "Yaxshi!",
                  imageUrl: imageUrl,
                  createdAt: DateTime.now().toString(),
                );
                Provider.of<CategoriesViewModel>(context, listen: false)
                  ..addCategory(categoryModel)
                  ..updateCategory(categoryModel);
              },
              icon: const Icon(Icons.add)),
          if (imageUrl.isNotEmpty)
            Image.network(
              imageUrl,
              width: 200,
              height: 200,
            ),
          IconButton(
              onPressed: () {
                _showPicker(context);
              },
              icon: const Icon(Icons.upload)),
        ],
      ),
    );
  }

  void _showPicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
              child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text("Gallery"),
                onTap: () {
                  _getFromGallery();
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt_outlined),
                title: const Text("Gallery"),
                onTap: () {
                  _getFromCamera();
                  Navigator.of(context).pop();
                },
              )
            ],
          ));
        });
  }

  _getFromGallery() async {
    XFile? pickedFile = await _picker.pickImage(
      maxWidth: 1920,
      maxHeight: 2000,
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      if (!mounted) return;
      imageUrl = await FileUploader.imageUploader(pickedFile);
      setState(() {});
    }
  }

  _getFromCamera() async {
    XFile? pickedFile = await _picker.pickImage(
      maxWidth: 1920,
      maxHeight: 2000,
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      if (!mounted) return;
      imageUrl = await FileUploader.imageUploader(pickedFile);
      setState(() {});
    }
  }
}
