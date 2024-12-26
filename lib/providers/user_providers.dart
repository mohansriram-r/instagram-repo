import 'package:flutter/foundation.dart';
import 'package:instagram_clone/models/user_model.dart';

class UserProviders extends ChangeNotifier {
  UserM? _user;

  UserM get getUser => _user!;

  Future<void> refreshUser() async{
    
  }
}
