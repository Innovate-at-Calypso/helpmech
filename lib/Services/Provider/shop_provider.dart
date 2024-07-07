import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:helpmech/Models/shop_model.dart';

class ShopProvider extends ChangeNotifier {
  ShopModel _shopModel = ShopModel(
    location: '',
    pincode: '',
    shopName: '',
    ownerName: '',
    phoneNumber: '',
    token: '',
  );

  ShopModel get shopModel => _shopModel;

  void shopDetails(String details) {
    Map<String, dynamic> data = jsonDecode(details);
    _shopModel = ShopModel.fromJson(data);
    notifyListeners(); // Notify listeners of state change
  }
}
