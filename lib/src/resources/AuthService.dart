import 'dart:async';

import 'package:flutter/cupertino.dart';

class AuthService with ChangeNotifier {
  var currentUser;

  AuthService() {
    print('New AuthService');
  }

  Future getUser() {
    return Future.value(currentUser);
  }

  Future logout() {
    this.currentUser = null;
    notifyListeners();
    return Future.value(currentUser);
  }

  Future createUser({String firstName, String lastName, String username, String password}) async {

  }

  Future login({String username, String password}) {
    if (password == 'password123') {
      this.currentUser = {'username': username};
      notifyListeners();
      return Future.value(currentUser);
    } else {
      this.currentUser = null;
      return Future.value(null);
    }
  }
}