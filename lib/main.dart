import 'package:flutter/material.dart';
import 'package:all_for_my_pet/splash/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'All for my pet',
      theme: ThemeData(
          //primarySwatch: Colors.blue,
          ),
      home: const SplashView(),
    );
  }
}
