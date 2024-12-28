import 'package:flutter/material.dart';
import 'package:instagram_clone/presentation/add_post_page/add_post_screen.dart';

class GlobalVariable {
  GlobalVariable._();

  static List<Widget> pageItems = [
    const Text("Home"),
    const Text("Search"),
    const AddPostScreen(),
    const Text("Notification"),
    const Text("Profile"),
  ];
}