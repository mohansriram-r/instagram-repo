import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Helper {
  pickImage(ImageSource source) async {
    ImagePicker imagePicker = ImagePicker();

    XFile? file = await imagePicker.pickImage(source: source);

    if (file != null) {
      return file.readAsBytes();
    }
  }

  showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }

  navigatorPush(BuildContext context, Widget route) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => route,
      ),
    );
  }

  navigatorPushReplacement(BuildContext context, Widget route) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => route,
      ),
    );
  }
}
