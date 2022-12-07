import 'package:edevice/presentation/tab_box/card_page/card_screen.dart';
import 'package:edevice/presentation/tab_box/home_page/home_screen.dart';
import 'package:edevice/presentation/tab_box/profile_page/profile_page.dart';
import 'package:edevice/utils/images.dart';
import 'package:edevice/view_model/tab_view_model.dart';
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
    _screens.add(HomeScreen());
    _screens.add(CardScreen());
    _screens.add(ProfilePage());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var index = context.watch<TabViewModel>().activePageIndex;
    print(DateTime.now().toString());
    return Scaffold(
      body: _screens[index],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        onTap: (value) => Provider.of<TabViewModel>(context, listen: false)
            .chanePageIndex(value),
        items: [
          BottomNavigationBarItem(icon: SvgPicture.asset(MyImages.ic_home,color: Colors.black,), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined), label: ""),
          BottomNavigationBarItem(icon: SvgPicture.asset(MyImages.ic_profile,color: Colors.black,), label: ""),
        ],
      ),
    );
  }
}
