import 'package:edevice/utils/color.dart';
import 'package:edevice/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../utils/images.dart';

class InfoPage extends StatefulWidget {
  String? image;
  String? name;
  String? series;
  int? price;
  String? info;

  InfoPage(
      {super.key,
      required this.image,
      required this.name,
      required this.series,
      required this.price,
      required this.info});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 34, top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    MyImages.back_icon,
                    color: Colors.black,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 50),
                    child: SvgPicture.asset(MyImages.favorite_icon),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
                width: 230,
                height: 230,
                child: Image.asset(
                  widget.image ?? "",
                  fit: BoxFit.cover,
                )),
            const SizedBox(
              height: 40,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                height: 450,
                decoration: BoxDecoration(
                  color: const Color(0xFFF6F6F9),
                  border: Border.all(color: Colors.grey.withOpacity(0.4)),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(18),
                      topRight: Radius.circular(18)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 50,
                      ),
                      child: Text(
                        widget.info ?? "",
                        style:
                            MyTextStyle.RelawayMedium500.copyWith(fontSize: 28),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 46, top: 8),
                      child: Text(
                        'Colors',
                        style:
                            MyTextStyle.RelawayMedium500.copyWith(fontSize: 20),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: myColorsWidget(
                              const Color(0xFF7485C1), 'Sky Blue'),
                        ),
                        const SizedBox(
                          width: 9,
                        ),
                        myColorsWidget(const Color(0xFFC9A19C), 'Rose Gold'),
                        const SizedBox(
                          width: 9,
                        ),
                        myColorsWidget(const Color(0xFFA1C89B), 'Green'),
                      ],
                    ),
                    const SizedBox(
                      height: 36,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 45),
                      child: Text(
                        "Get Apple TV+ free for a year",
                        style:
                            MyTextStyle.RalewayBold700.copyWith(fontSize: 20),
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 45),
                      child: Text(
                        "Available when you purchase any new \niPhone, iPad, iPod Touch, Mac or Apple TV, \n£4.99/month after free trial.",
                        style: MyTextStyle.RelawayMedium500.copyWith(
                            color: Colors.black.withOpacity(0.5), fontSize: 18),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 45),
                      child: Row(
                        children: [
                          Text(
                            "Full description",
                            style: MyTextStyle.RalewayBold700.copyWith(
                                fontSize: 18, color: MyColors.C_5956E9),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          SvgPicture.asset(MyImages.next_icon)
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 34,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 48, right: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total",
                            style: MyTextStyle.RelawayMedium500.copyWith(
                                fontSize: 17),
                          ),
                          Text(
                            '\$${widget.price}' "",
                            style: MyTextStyle.RalewayBold700.copyWith(
                                fontSize: 22, color: MyColors.C_5956E9),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: Container(
                        width: 314,
                        height: 70,
                        decoration: BoxDecoration(
                          color: MyColors.C_5956E9,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                            child: Text(
                          "Add to basket",
                          style: MyTextStyle.RalewayBold700.copyWith(
                              fontSize: 20, color: Colors.white),
                        )),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget myColorsWidget(Color color, String text) {
    return Container(
      width: 104,
      height: 42,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey, width: 2)),
      child: Row(
        children: [
          const SizedBox(
            width: 8,
          ),
          Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(
            width: 6,
          ),
          Text(
            text,
            style: MyTextStyle.RelawayMedium500.copyWith(fontSize: 15),
          )
        ],
      ),
    );
  }
}
