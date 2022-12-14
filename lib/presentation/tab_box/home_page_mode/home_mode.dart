import 'package:edevice/data/models/category_model.dart';
import 'package:edevice/presentation/tab_box/profile_page/profile_page.dart';
import 'package:edevice/utils/color.dart';
import 'package:edevice/utils/images.dart';
import 'package:edevice/utils/style.dart';
import 'package:edevice/view_model/categories_view_model.dart';
import 'package:edevice/view_model/products_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../home_page/info_page.dart';

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
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40, left: 50),
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ProfilePage()));
                      },
                      child: SvgPicture.asset(MyImages.more_icon)),
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
              height: 30,
            ),
            SizedBox(
              height: 50,
              child: StreamBuilder<List<CategoryModel>>(
                stream:
                    Provider.of<CategoriesViewModel>(context, listen: false)
                        .listenCategories(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasData) {
                    List<CategoryModel> categories = snapshot.data!;
                    return Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: ListView.builder(
                        itemCount: categories.length,
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Provider.of<ProductViewModel>(
                                context,
                                listen: false,
                              ).listenProducts(categories[index].categoryId);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Container(
                                width: 100,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.4),
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(color: Colors.black),
                                ),
                                child: Center(
                                    child:
                                     Text(categories[index].categoryName)),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  }
                },
              ),
            ),
            Expanded(child: Consumer<ProductViewModel>(
              builder: (context, productViewModel, child) {
                return ListView.builder(
                    itemCount: productViewModel.products.length,
                    itemBuilder: (context,index){
                      var product = productViewModel.products[index];
                      return Container(
                        child: Column(
                          children: [
                            Image.network(product.productImages[0]),
                            Text(product.productName),
                          ],
                        ),
                      );
                });
              },
            )),
          ],
        ),
      ),
    );
  }
}

// ListView(
// children:
// List.generate(productViewModel.products.length, (index) {

// return ListTile(
// title:
// onTap: () {
// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (context) => InfoPage(
// productModel: product,
// )));
// },
// );
// }),
// );