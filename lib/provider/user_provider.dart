import 'package:flutter/material.dart';
import 'package:instagram_clone/models/user_model.dart';
import 'package:instagram_clone/service/auth_service.dart';

class UserProvider extends ChangeNotifier {
  UserModel? _user;

  UserModel get getUser => _user!;

  refreshUser() async {
    _user = await AuthService().getCurrentUserData();
    notifyListeners();
  }
}
