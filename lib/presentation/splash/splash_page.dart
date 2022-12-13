import 'package:edevice/utils/color.dart';
import 'package:edevice/utils/images.dart';
import 'package:edevice/utils/style.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.C_8381E8,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 50, top: 50),
              child: Text(
                "Find your \nGadget",
                style: MyTextStyle.RalewayBold700.copyWith(
                  fontSize: 65,
                  color: MyColors.C_F7F7F7,
                ),
              ),
            ),
            SizedBox(
                width: 486,
                height: 486,
                child: Image.asset(
                  MyImages.splash_image,
                )),
            SizedBox(
              height: 39,
            ),
            Center(
              child: InkWell(
                onTap: () {
                  // Navigator.pushNamed(context, RouteName.sign_in);
                },
                child: Container(
                    width: 314,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                        child: Text(
                      "Get started",
                      style: MyTextStyle.RelawayMedium500.copyWith(
                          fontSize: 20, color: MyColors.C_5956E9),
                    ))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
