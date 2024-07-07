import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

void httpErrorHandle({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
  required VoidCallback onFail,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;

    case 400:
      print("${jsonDecode(response.body)['msg'] ?? 'Unknown error'}");
      onFail();
      Fluttertoast.showToast(
          msg: jsonDecode(response.body)['msg'] ?? "Erro Will connecting");
      break;
    case 500:
      print("${jsonDecode(response.body)['error'] ?? 'Unknown error'}");
      onFail();
      Fluttertoast.showToast(msg: jsonDecode(response.body)['error']);
      break;
    default:
      onFail();
      Fluttertoast.showToast(msg: response.body);
  }
}
