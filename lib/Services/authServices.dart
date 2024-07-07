import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:helpmech/Routes/routes.dart';
import 'package:helpmech/Services/Provider/mech_provider.dart';
import 'package:helpmech/Services/Provider/shop_provider.dart';
import 'package:helpmech/Utils/httpErrorHandle.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Authservices {
  static void checkUser(BuildContext context) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString('token');
    bool? isMechanical = sharedPreferences.getBool('mech');

    if (token != null) {
      if (isMechanical == true) {
        mechLoginToken(context, token);
      } else {
        Navigator.pushReplacementNamed(context, Routes.homePage);
      }
    } else {
      Navigator.pushReplacementNamed(context, Routes.selectScreen);
    }
  }

  static void mechLogin(BuildContext context, String email, password) async {
    try {
      http.Response res = await http.post(
        Uri.parse('https://helpmech-backend.onrender.com/mech/login'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () async {
            var userProvider =
                Provider.of<MechProvider>(context, listen: false);
            SharedPreferences preferences =
                await SharedPreferences.getInstance();
            userProvider.setUser(res.body);
            preferences.setString('token', userProvider.mechUser.token);
            preferences.setBool('mech', true);
            Navigator.pushReplacementNamed(context, Routes.mechHome);
          },
          onFail: () {
            Navigator.pushReplacementNamed(context, Routes.selectScreen);
          });
    } catch (e) {
      print('Error during sign-up: $e');
      Fluttertoast.showToast(msg: 'Sign-up failed. Please try again.');
    }
  }

  static void mechLoginToken(BuildContext context, String token) async {
    try {
      // Step 1: Validate the mechanic's token
      http.Response res = await http.post(
        Uri.parse('https://helpmech-backend.onrender.com/mech/tokenIsVaild'),
        body: jsonEncode({
          'token': token,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      print('Mechanic Token Validation Status Code: ${res.statusCode}');
      print('Mechanic Token Validation Response Body: ${res.body}');

      // Step 2: Handle response based on token validation
      if (res.statusCode == 200) {
        // Token is valid, proceed to fetch shop details
        http.Response res1 = await http.post(
          Uri.parse('https://helpmech-backend.onrender.com/shop/get'),
          body: jsonEncode({
            'shopToken': token,
          }),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
        );

        print('Shop Details Status Code: ${res1.statusCode}');
        print('Shop Details Response Body: ${res1.body}');

        // Step 3: Update Provider with received data
        var userProvider = Provider.of<MechProvider>(context, listen: false);
        SharedPreferences preferences = await SharedPreferences.getInstance();
        userProvider.setUser(res.body);

        var shopProvider = Provider.of<ShopProvider>(context, listen: false);
        shopProvider.shopDetails(res1.body);

        // Step 4: Save token and navigate based on user type
        preferences.setString('token', userProvider.mechUser.token);
        preferences.setBool('mech', true);
        Navigator.pushReplacementNamed(context, Routes.mechHome);
      } else {
        // Token validation failed, navigate to selectScreen
        Navigator.pushReplacementNamed(context, Routes.selectScreen);
        Fluttertoast.showToast(msg: 'Mechanic token validation failed.');
      }
    } catch (e) {
      // Step 5: Handle exceptions
      print('Error during token validation: $e');
      Fluttertoast.showToast(msg: 'Token validation failed. Please try again.');
    }
  }
}
