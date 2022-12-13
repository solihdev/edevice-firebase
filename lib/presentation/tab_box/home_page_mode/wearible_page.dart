import 'package:edevice/utils/color.dart';
import 'package:edevice/utils/images.dart';
import 'package:edevice/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WearablePage extends StatelessWidget {
  const WearablePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF2F2F2),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      color: const Color(0xfff2f2f2f2),
                      child: Column(
                        children: [
                          // InkWell(
                          //   // onTap: () {
                          //   //   Navigator.pushNamed(context, RouteName.info,arguments: {
                          //   //     "image": ProductModel.products[index].image,
                          //   //     "name": ProductModel.products[index].name,
                          //   //     "series": ProductModel.products[index].series,
                          //   //     "price": ProductModel.products[index].price,
                          //   //     "info": ProductModel.products[index].info,
                          //   //   });
                          //   // },
                          //   child: Padding(
                          //     padding: const EdgeInsets.only(top: 60),
                          //     child: Container(
                          //       margin: const EdgeInsets.symmetric(horizontal: 6),
                          //       width: 220,
                          //       height: 290,
                          //       decoration: BoxDecoration(
                          //           color: Colors.white,
                          //           border: Border.all(color: Colors.grey.withOpacity(0.1)),
                          //           borderRadius: BorderRadius.circular(20)),
                          //       child: Column(
                          //         children: [
                          //           Container(
                          //               height: 190,
                          //               width: 190,
                          //               child: Image.asset(ProductModel.products[index].image,)),
                          //           SizedBox(
                          //             height: 8,
                          //           ),
                          //           Container(
                          //             child: Text(ProductModel.products[index].name,style: MyTextStyle.RalewayBold700.copyWith(fontSize: 22),),
                          //           ),
                          //           SizedBox(height: 4,),
                          //           Container(
                          //             child: Text(ProductModel.products[index].series,style: MyTextStyle.RalewayBold700.copyWith(fontSize: 16, color: MyColors.C_868686),),
                          //           ),
                          //           SizedBox(height: 12,),
                          //           Container(
                          //             child: Text('\$ ${ProductModel.products[index].price.toString()}',style: MyTextStyle.RalewayBold700.copyWith(fontSize: 17, color: MyColors.C_5956E9),),
                          //           ),
                          //         ],
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    );
                  }),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 28),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                      onTap: () {},
                      child: Text(
                        "see more",
                        style: MyTextStyle.RalewayBold700.copyWith(
                            fontSize: 17, color: MyColors.C_5956E9),
                      )),
                  const SizedBox(
                    width: 8,
                  ),
                  SvgPicture.asset(
                    MyImages.next_icon,
                    color: MyColors.C_5956E9,
                  )
                ],
              ),
            )
          ],
        ));
  }
}
