import 'package:edevice/data/models/category_model.dart';
import 'package:edevice/utils/color.dart';
import 'package:edevice/utils/images.dart';
import 'package:edevice/utils/style.dart';
import 'package:edevice/view_model/categories_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {

  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2F2),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40, left: 50),
                    child: SvgPicture.asset(MyImages.more_icon),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30, left: 30),
                    child: Container(
                      width: 250,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                            color: Colors.grey.withOpacity(0.3), width: 2),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 16,
                          ),
                          SvgPicture.asset(MyImages.search_icon),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Search",
                            style: MyTextStyle.RelawayMedium500.copyWith(
                                fontSize: 18, color: MyColors.C_868686),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                  padding: const EdgeInsets.only(left: 50),
                  child: Text(
                    "Order online \ncollect in store",
                    style: MyTextStyle.RalewayBold700.copyWith(fontSize: 34),
                  )),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                height: 200,
                child: StreamBuilder<List<CategoryModel>>(
                  stream: Provider.of<CategoriesViewModel>(
                      context, listen: false)
                      .listenCategories(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasData) {
                      List<CategoryModel> categories = snapshot.data!;
                      return DefaultTabController(
                        initialIndex: 0,
                        length: categories.length, child: Column(
                        children: [

                        ],
                      ),);
                    } else {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}