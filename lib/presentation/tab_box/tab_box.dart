import 'package:edevice/presentation/tab_box/card_page/card_screen.dart';
import 'package:edevice/presentation/tab_box/home_page_mode/home_mode.dart';
import 'package:edevice/utils/images.dart';
import 'package:edevice/view_model/profile_view_model.dart';
import 'package:edevice/view_model/tab_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class TabBox extends StatefulWidget {
  const TabBox({Key? key}) : super(key: key);

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  List<Widget> _screens = [];

  @override
  void initState() {
    _screens.add(const MenuPage());
    _screens.add(const CardPage());
    _printFirebaseCloudMessagingToken();
    super.initState();
  }

  _printFirebaseCloudMessagingToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    if(!mounted) return;
    Provider.of<ProfileViewModel>(context,listen: false).updateFCMToken(token??"", FirebaseAuth.instance.currentUser!.uid);
    print("FCM TOKEN : $token");
  }

  @override
  Widget build(BuildContext context) {
    var index = context.watch<TabViewModel>().activePageIndex;
    print(DateTime.now().toString());
    return Scaffold(
      body: _screens[index],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        onTap: (value) => Provider.of<TabViewModel>(context, listen: false)
            .chanePageIndex(value),
        items: [
          BottomNavigationBarItem(icon: SvgPicture.asset(MyImages.ic_home,color: Colors.black,), label: ""),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(MyImages.buy_icon,color: Colors.black,), label: ""),
        ],
      ),
    );
  }
}
