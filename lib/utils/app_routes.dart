// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// abstract class RouteName{
//   static const splash='/splash';
//   static const sign_in='/signIn';
//   static const sign_up='/signUp';
//   static const menu='/menu';
//   static const info='/info';
//   static const wearable='/wearable';
//   static const main='/main';
//
// }
//
// class AppRoutes{
//   static Route generateRoute(RouteSettings settings){
//     switch(settings.name){
//       case RouteName.splash:
//         return MaterialPageRoute(builder: (_)=>SplashPage());
//       case RouteName.sign_in:
//         return MaterialPageRoute(builder: (_)=>SignInPage());
//       case RouteName.sign_up:
//         return MaterialPageRoute(builder: (_)=>SignUpPage());
//       case RouteName.menu:
//         return MaterialPageRoute(builder: (_)=>MenuPage());
//       case RouteName.info:
//         final args=settings.arguments as Map<String, dynamic>;
//         return MaterialPageRoute(builder: (_)=>InfoPage(image: args['image'], name: args['name'], series: args["series"], price: args['price'], info: args['info'],));
//       case RouteName.wearable:
//         return MaterialPageRoute(builder: (_)=>WearablePage());
//       case RouteName.main:
//         return MaterialPageRoute(builder: (_)=>MainPage());
//       default:
//         return MaterialPageRoute(builder: (_)=>Scaffold());
//     }
//   }
// }