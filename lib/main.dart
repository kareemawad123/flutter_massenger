import 'package:first_day/view/Chats/chatPage.dart';
import 'package:first_day/view/layout/main_layout.dart';
import 'package:first_day/view/users/users.dart';
import 'package:flutter/material.dart';
import 'view/Login/loginPage.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );

  }
}
