import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edevice/presentation/auth/auth_page.dart';
import 'package:edevice/presentation/tab_box/tab_box.dart';
import 'package:edevice/view_model/auth_view_model.dart';
import 'package:edevice/view_model/categories_view_model.dart';
import 'package:edevice/view_model/products_view_model.dart';
import 'package:edevice/view_model/tab_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/repositories/auth_repository.dart';
import 'data/repositories/categories_repository.dart';
import 'data/repositories/product_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var fireStore=FirebaseFirestore.instance;

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
                categoryRepository: CategoryRepository(
                    firebaseFirestore: fireStore))),
        Provider(
            create: (context) => AuthViewModel(
                authRepository: AuthRepository(
                  firebaseAuth: FirebaseAuth.instance,
                ))),
        ChangeNotifierProvider(create: (context) => TabViewModel()),
      ],
      child: MyApp(),
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
