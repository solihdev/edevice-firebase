import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edevice/data/repositories/order_repository.dart';
import 'package:edevice/data/repositories/profile_repository.dart';
import 'package:edevice/presentation/auth/auth_page.dart';
import 'package:edevice/presentation/tab_box/tab_box.dart';
import 'package:edevice/view_model/auth_view_model.dart';
import 'package:edevice/view_model/categories_view_model.dart';
import 'package:edevice/view_model/orders_view_model.dart';
import 'package:edevice/view_model/products_view_model.dart';
import 'package:edevice/view_model/profile_view_model.dart';
import 'package:edevice/view_model/tab_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/repositories/auth_repository.dart';
import 'data/repositories/categories_repository.dart';
import 'data/repositories/product_repository.dart';
import 'presentation/tab_box/home_page_mode/home_mode.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseMessaging.instance.subscribeToTopic("users");
  var fireStore = FirebaseFirestore.instance;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductViewModel(
            productRepository: ProductRepository(
              firebaseFirestore: fireStore,
            ),
          ),
        ),
        ChangeNotifierProvider(
            create: (context) => CategoriesViewModel(
                categoryRepository:
                    CategoryRepository(firebaseFirestore: fireStore))),
        ChangeNotifierProvider(
            create: (context) => OrdersViewModel(
                ordersRepository:
                    OrdersRepository(firebaseFirestore: fireStore))),
        Provider(
            create: (context) => AuthViewModel(
                    authRepository: AuthRepository(
                  firebaseAuth: FirebaseAuth.instance,
                ))),
        ChangeNotifierProvider(create: (context) => TabViewModel()),
        ChangeNotifierProvider(
          create: (context) => ProfileViewModel(
              firebaseAuth: FirebaseAuth.instance,
              profileRepository: ProfileRepository(firebaseFirestore: fireStore)
          ),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.hasData) {
          return const TabBox();
        } else {
          print(snapshot.error);
          return const AuthPage();
        }
      },
    );
  }
}
