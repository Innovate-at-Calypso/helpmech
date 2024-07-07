import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:helpmech/Models/mech_models.dart';

class MechProvider extends ChangeNotifier {
  var _mechUser = MechModels(
    userName: '',
    userEmail: '',
    password: '',
    token: '',
    isEmail: false,
    isMech: true,
    isShop: false,
  );

  MechModels get mechUser => _mechUser;

  void setUser(String user) {
    Map<String, dynamic> userData = jsonDecode(user);
    _mechUser = MechModels.fromJson(userData);
    notifyListeners();
  }
}
