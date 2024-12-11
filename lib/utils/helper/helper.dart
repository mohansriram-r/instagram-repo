import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Helper {
  pickImage(ImageSource sourse) {}
  showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }
}
