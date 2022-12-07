import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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

  String accountName="${FirebaseAuth.instance.currentUser?.email.toString()}";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Profile Page",style: TextStyle(color: Colors.black,fontSize: 24),),),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height ,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Form(
              key: formKey,
              child: Column(children: [
                SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                Container(
                  child: CircleAvatar(
                    radius: 100,
                    backgroundImage: NetworkImage("https://i.pravatar.cc/300"),),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
                Text(
                  accountName,
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 30),
                  child: const Text('settings',),),
                Padding(
                  padding: const EdgeInsets.only(left: 32, right: 10),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 30),
                    child: const Text('Account',)),
                titleWidget(MyImages.ic_key, 'Change account password'),
                titleWidget(MyImages.ic_camera, 'Change account Image'),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 30),
                    child: const Text('Uptodo', style: TextStyle())),
                titleWidget(MyImages.ic_about, 'About US'),
                titleWidget(MyImages.ic_faq, 'FAQ'),
                titleWidget(MyImages.ic_help_feedback, 'Help & Feedback'),
                titleWidget(MyImages.ic_like, 'Support US'),
                logoutWidget(),
              ]),
            ),
          ),
        ),
      ),
    );
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
      trailing: Icon(Icons.chevron_right),
    );
  }

  Widget logoutWidget() {
    return ListTile(
      leading: Padding(
        padding: const EdgeInsets.only(left: 14),
        child: SvgPicture.asset(
          MyImages.ic_log_out,
          width: 26,
          color: Colors.red,
        ),
      ),
      title:  Text(
        'Log out',
        style: TextStyle(color: Colors.red, fontSize: 18),
      ),
    );
  }
}
