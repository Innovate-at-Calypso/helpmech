import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:helpmech/Services/Provider/mech_provider.dart';
import 'package:helpmech/Services/Provider/shop_provider.dart';
import 'package:http/http.dart' as http;
import 'package:helpmech/Utils/httpErrorHandle.dart';
import 'package:helpmech/Routes/routes.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShopServices {
  static void shopRegister({
    required String location,
    required String pincode,
    required String shopName,
    required String ownerName,
    required String phoneNumber,
    required String token,
    required BuildContext context,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('https://helpmech-backend.onrender.com/shop/register'),
        body: jsonEncode({
          'location': location,
          'pincode': pincode,
          'shopName': shopName,
          'ownerName': ownerName,
          'phoneNumber': phoneNumber,
          'shopToken': token,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      print(res.statusCode);

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          SharedPreferences preferences = await SharedPreferences.getInstance();
          Provider.of<MechProvider>(context, listen: false).mechUser.isShop =
              true;
          var shopProvider = Provider.of<ShopProvider>(context, listen: false);
          shopProvider.shopDetails(res.body);
          Fluttertoast.showToast(msg: "Shop registered successfully!");
          Navigator.pushReplacementNamed(context, Routes.mechHome);
        },
        onFail: () {},
      );
    } catch (e) {
      print('Error during shop registration: $e');
      Fluttertoast.showToast(
          msg: 'Shop registration failed. Please try again.');
    }
  }
}
