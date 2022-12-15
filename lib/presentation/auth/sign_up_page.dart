import 'package:edevice/data/models/user_model.dart';
import 'package:edevice/utils/my_utils.dart';
import 'package:edevice/utils/style.dart';
import 'package:edevice/view_model/auth_view_model.dart';
import 'package:edevice/view_model/profile_view_model.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../utils/color.dart';
import '../../utils/images.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key, required this.onClickedSignIn});

  final VoidCallback onClickedSignIn;

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isVisibility = true;
  bool isVisibility2 = true;
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: MyColors.C_5956E9,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    const SizedBox(
                      height: 287,
                      width: double.infinity,
                    ),
                    Positioned(
                        top: 99,
                        left: 50,
                        child: Text(
                          "Welcome \nback",
                          style: MyTextStyle.RalewayBold700.copyWith(
                              fontSize: 76, color: Colors.white),
                        )),
                    Positioned(
                        top: 26,
                        left: 70,
                        child: SvgPicture.asset(
                          MyImages.circle_icon,
                          width: 30,
                        )),
                    Positioned(
                        left: 246, child: SvgPicture.asset(MyImages.moon_icon)),
                    Positioned(
                        top: 230,
                        left: 309,
                        child: SvgPicture.asset(
                          MyImages.circle_icon,
                          width: 40,
                        ))
                  ],
                ),
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Container(
                    width: double.infinity,
                    height: 600,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(18),
                          topRight: Radius.circular(18)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 50, top: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset(MyImages.email_icon),
                              const SizedBox(
                                width: 15,
                              ),
                              Text("Email",
                                  style: MyTextStyle.RalewayBold700.copyWith(
                                    fontSize: 16,
                                    color: MyColors.C_868686.withOpacity(0.5),
                                  )),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 50),
                            child: TextFormField(
                              controller: emailController,
                              textInputAction: TextInputAction.next,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              style: const TextStyle(color: Colors.black),
                              keyboardType: TextInputType.text,
                              obscureText: false,
                              validator: (email) => email != null &&
                                      !EmailValidator.validate(email)
                                  ? "Enter a valid email"
                                  : null,
                              decoration: const InputDecoration(
                                hintStyle: TextStyle(color: MyColors.C_868686),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: MyColors.C_868686,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(MyImages.password_icon),
                              const SizedBox(
                                width: 15,
                              ),
                              const Text("Password"),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 50),
                            child: TextFormField(
                              controller: passwordController,
                              style: const TextStyle(color: Colors.black),
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              obscureText: isVisibility,
                              validator: (password) =>
                                  password != null && password.length < 6
                                      ? "Enter at least 6 character !"
                                      : null,
                              decoration: InputDecoration(
                                suffixIcon: TextButton(
                                    onPressed: () {
                                      setState(() {
                                        isVisibility = !isVisibility;
                                      });
                                    },
                                    child: isVisibility
                                        ? Text(
                                            "Show",
                                            style: MyTextStyle.RalewayBold700
                                                .copyWith(
                                                    color: MyColors.C_5956E9),
                                          )
                                        : Text(
                                            "Hide",
                                            style: MyTextStyle.RalewayBold700
                                                .copyWith(
                                                    color: MyColors.C_5956E9),
                                          )),
                                hintStyle:
                                    const TextStyle(color: MyColors.C_868686),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: MyColors.C_868686,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(MyImages.password_icon),
                              const SizedBox(
                                width: 15,
                              ),
                              const Text("Configure password"),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 50),
                            child: TextFormField(
                              controller: confirmPasswordController,
                              textInputAction: TextInputAction.done,
                              style: const TextStyle(color: Colors.black),
                              keyboardType: TextInputType.text,
                              obscureText: isVisibility2,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (password) =>
                                  password != null && password.length < 6
                                      ? "Enter at least 6 character !"
                                      : null,
                              decoration: InputDecoration(
                                suffixIcon: TextButton(
                                    onPressed: () {
                                      setState(() {
                                        isVisibility2 = !isVisibility2;
                                      });
                                    },
                                    child: isVisibility2
                                        ? Text(
                                            "Show",
                                            style: MyTextStyle.RalewayBold700
                                                .copyWith(
                                                    color: MyColors.C_5956E9),
                                          )
                                        : Text(
                                            "Hide",
                                            style: MyTextStyle.RalewayBold700
                                                .copyWith(
                                                    color: MyColors.C_5956E9),
                                          )),
                                hintStyle:
                                    const TextStyle(color: MyColors.C_868686),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: MyColors.C_868686,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          InkWell(
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                signUp();
                                // Navigator.pushNamed(context, RouteName.main);
                              }
                            },
                            child: Container(
                              width: 300,
                              height: 70,
                              decoration: BoxDecoration(
                                color: MyColors.C_5956E9,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                  child: Text(
                                "Login",
                                style: MyTextStyle.RalewayBold700.copyWith(
                                    fontSize: 20, color: Colors.white),
                              )),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                              child: Padding(
                            padding: const EdgeInsets.only(right: 50),
                            child: RichText(
                                text: TextSpan(
                                    style: MyTextStyle.sfProRegular.copyWith(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                    text: "Already have an account? ",
                                    children: [
                                  TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = widget.onClickedSignIn,
                                    text: "Sign In",
                                    style: MyTextStyle.sfProBold.copyWith(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  )
                                ])),
                          ))
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  signUp() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    if (confirmPassword == password) {
      await Provider.of<AuthViewModel>(context, listen: false).signUp(
        password: password,
        email: email,
      );
      String? fcmToken = await FirebaseMessaging.instance.getToken();
      Provider.of<ProfileViewModel>(context, listen: false).addUser(
        UserModel(
          age: 0,
          userId: FirebaseAuth.instance.currentUser!.uid,
          fullName: "",
          email: email,
          createdAt: DateTime.now().toString(),
          imageUrl: "",
          fcmToken: fcmToken ?? "",
        ),
      );
    } else {
      MyUtils.getMyToast(message: "Passwords don't match!");
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
