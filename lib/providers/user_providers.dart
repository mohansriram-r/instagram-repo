import 'package:flutter/foundation.dart';
import 'package:instagram_clone/models/user_model.dart';
import 'package:instagram_clone/service/auth_service.dart';

class UserProviders extends ChangeNotifier {
  UserM? _user;
  final AuthService _authService = AuthService();

  UserM get getUser => _user!;

  refreshUser() async {
    UserM user = await _authService.getCurrentUserData();
    _user = user;
    print(_user!.email);
    notifyListeners();
  }
}
