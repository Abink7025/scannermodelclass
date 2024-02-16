import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:scannermodelclass/models/scanner_model.dart';
import 'package:scannermodelclass/utils/api_const.dart';

class ApiServices {
  Future<Scanner> register(
      {required String name,
      required String rollno,
      required String email,
      required String password,
      required BuildContext context}) async {
    try {
      final resonse = await http.post(
        Uri.parse(baseurl + registerurl),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          {
            "name": name,
            "email": email,
            "password": password,
            "rollno": rollno
          },
        ),
      );
      var data = jsonDecode(resonse.body);

      print(data);

      if (resonse.statusCode == 200) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(data)));
        return Scanner.fromJson(data);
      } else {
        throw Exception(data["message"]);
      }
    } on FormatException {
      throw Exception('Formate exception');
    } catch (e) {
      throw Exception('Somthing went wrong');
    }
  }

  Future<Scanner?> login({
    required String rollno,
    required String passwords,
    required BuildContext context,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(baseurl + loginurl),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({"rollno": rollno, "password": passwords}),
      );

      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Success"),
          ),
        );
        print('fffffffffff');
        var f = Scanner.fromJson(data);
        print(f);
        print('fgfgfgfgfg');

        return Scanner.fromJson(data);
      } else {
        print("1");
        throw Exception(data["message"]);
      }
    } on FormatException {
      print('2');
      throw Exception('Formate exception');
    } catch (e) {
      print('3');
      throw Exception('Something went wrong');
    }
  }

  Future<Scanner> profile(
      {required String rollno, required BuildContext context}) async {
    try {
      final response = await http.get(
        Uri.parse(baseurl + profileurl + rollno),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print('5676hhhh');
      print(Uri.parse(baseurl + profileurl + rollno));
      var data = jsonDecode(response.body);

      print(data);
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Success"),
          ),
        );

        return Scanner.fromJson(data);
      } else {
        throw Exception(data["message"]);
      }
    } catch (e) {
      rethrow;
    }
  }
}
