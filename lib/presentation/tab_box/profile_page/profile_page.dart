import 'package:edevice/view_model/profile_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../../data/services/file_uploader.dart';
import '../../../utils/images.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    super.key,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final formKey = GlobalKey<FormState>();

  String accountName = "${FirebaseAuth.instance.currentUser?.email.toString()}";

  final ImagePicker _picker = ImagePicker();
  String imageUrl = '';
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            "Profile Page",
            style: TextStyle(color: Colors.black, fontSize: 24),
          ),
        ),
        body: Consumer<ProfileViewModel>(
          builder: (context, profileViewModel, child) {
            return profileViewModel.user != null
                ? SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child:  SizedBox(
                  height: MediaQuery.of(context).size.height * 1.1,
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: Form(
                      key: formKey,
                      child: Column(children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        isLoading ? const CircularProgressIndicator() : const SizedBox(),
                        Container(
                            height: 200,
                            width: 200,
                            decoration: const BoxDecoration(shape: BoxShape.circle),
                            child: imageUrl.isEmpty
                                ? Image.network(
                              "https://i.pravatar.cc/300",
                              fit: BoxFit.cover,
                            )
                                : Image.network(
                              imageUrl,
                              fit: BoxFit.cover,
                            )),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.025,
                        ),
                        Text(
                          accountName,
                          style: const TextStyle(
                            fontSize: 25,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 32, right: 10),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(left: 30),
                            child: const Text(
                              'Account',
                            )),
                        titleWidget(MyImages.ic_key, 'Change account password'),
                        InkWell(
                            onTap: () {
                              _showPicker(context);
                            },
                            child:
                            titleWidget(MyImages.ic_camera, 'Change account Image')),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(left: 30),
                            child: const Text('e-Device', style: TextStyle())),
                        titleWidget(MyImages.ic_about, 'About US'),
                        titleWidget(MyImages.ic_faq, 'FAQ'),
                        titleWidget(MyImages.ic_help_feedback, 'Help & Feedback'),
                        titleWidget(MyImages.ic_like, 'Support US'),
                        InkWell(
                          onTap: (){
                            FirebaseAuth.instance.signOut();
                          },
                          child: ListTile(
                            leading: Padding(
                              padding: const EdgeInsets.only(left: 14),
                              child: SvgPicture.asset(
                                MyImages.ic_log_out,
                                width: 26,
                                color: Colors.red,
                              ),
                            ),
                            title: const Text(
                              'Log out',
                              style: TextStyle(color: Colors.red, fontSize: 18),
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                )):const Center(child: CircularProgressIndicator());
          },
        ));
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
      setState(() {
        isLoading = false;
      });
      imageUrl = await FileUploader.imageUploader(pickedFile);
      setState(() {
        isLoading = false;
      });
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
      // Provider.of<CategoriesViewModel>(context).toString();
      setState(() {});
    }
  }

  Widget titleWidget(icon, word) {
    return ListTile(
      leading: Padding(
        padding: const EdgeInsets.only(left: 14),
        child: SvgPicture.asset(
          icon,
          width: 26,
          color: Colors.black,
        ),
      ),
      title: Text(
        word,
        style: const TextStyle(fontSize: 18),
      ),
      trailing: const Icon(Icons.chevron_right),
    );
  }
}
