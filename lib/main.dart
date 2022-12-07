import 'package:edevice/presentation/auth/auth_page.dart';
import 'package:edevice/presentation/tab_box/tab_box.dart';
import 'package:edevice/view_model/auth_view_model.dart';
import 'package:edevice/view_model/tab_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/repositories/auth_repository.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TabViewModel()),
        Provider(
            create: (context) => AuthViewModel(
                    authRepository: AuthRepository(
                  firebaseAuth: FirebaseAuth.instance,
                ))),
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
      stream: Provider.of<AuthViewModel>(context).checkAuthState(),
      builder: (context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.hasData) {
          User? user = snapshot.data;
          return user == null ? AuthPage() : TabBox();
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
