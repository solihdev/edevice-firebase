import 'package:edevice/utils/color.dart';
import 'package:edevice/utils/style.dart';
import 'package:edevice/view_model/auth_view_model.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../utils/images.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key,required this.onClickSignUp}):super(key: key);

  final VoidCallback onClickSignUp;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

final _formkey = GlobalKey<FormState>();

class _LoginPageState extends State<LoginPage> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isvisiblity = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: MyColors.C_5956E9,
          body: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
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
                        )),
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: 540,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(18),
                        topRight: Radius.circular(18)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 36),
                          child: Text(
                            'Login',
                            style: MyTextStyle.RelawayMedium500.copyWith(
                                fontSize: 20),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
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
                            style: const TextStyle(color: Colors.black),
                            keyboardType: TextInputType.text,
                            obscureText: false,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter your Email";
                              }
                              return null;
                            },
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
                        Row(children: [
                          SvgPicture.asset(MyImages.password_icon),
                          const SizedBox(
                            width: 15,
                          ),
                          Text("Password",
                              style: MyTextStyle.RalewayBold700.copyWith(
                                fontSize: 16,
                                color: MyColors.C_868686,
                              ))
                        ]),
                        Padding(
                          padding: const EdgeInsets.only(right: 50),
                          child: TextFormField(
                            controller: passwordController,
                            // obscureText: true,
                            textInputAction: TextInputAction.done,
                            style: const TextStyle(color: Colors.black),
                            keyboardType: TextInputType.text,
                            obscureText: isvisiblity,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter your Password";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              suffixIcon: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      isvisiblity = !isvisiblity;
                                    });
                                  },
                                  child: isvisiblity
                                      ? Text(
                                          "Show",
                                          style: MyTextStyle.RalewayBold700
                                              .copyWith(
                                                  color: MyColors.C_5956E9),
                                        )
                                      : Text(
                                          "Hide",
                                          style:
                                              MyTextStyle.RalewayBold700.copyWith(
                                                  color: MyColors.C_5956E9),
                                        )),
                              hintStyle:
                                  const TextStyle(color: MyColors.C_868686),
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
                          height: 15,
                        ),
                        Text(
                          "Forgot password",
                          style: MyTextStyle.RelawayRegular400.copyWith(
                              color: MyColors.C_5956E9),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        InkWell(
                          onTap: () {
                            if (_formkey.currentState!.validate()) {
                              // Navigator.pushNamed(context, RouteName.main);
                              signIn();
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
                          height: 30,
                        ),
                        Center(
                            child: Padding(
                          padding: const EdgeInsets.only(right: 50),
                          child: RichText(
                            text: TextSpan(
                              style: MyTextStyle.sfProRegular
                                  .copyWith(color:  Colors.black, fontSize: 16,fontWeight: FontWeight.w400),
                              text: "Don't have an account?  ",
                              children: [
                                TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = widget.onClickSignUp,
                                  text: "Sign Up",
                                  style: MyTextStyle.sfProBold.copyWith(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700
                                  ),
                                )
                              ],
                            ),
                          ),
                        ))
                      ],
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
  Future<void> signIn() async {
    Provider.of<AuthViewModel>(context,listen: false).signIn(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
