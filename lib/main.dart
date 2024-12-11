import 'package:flutter/material.dart';
import 'package:instagram_clone/presentation/create_account/create_account_page.dart';
import 'package:instagram_clone/presentation/login_page/login_screen.dart';
import 'package:instagram_clone/utils/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram-Clone',
      theme: CThemeData.darkThemeData,
      home: CreateAccountPage(),
    );
  }
}
