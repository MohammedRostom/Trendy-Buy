import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:note_app_with_cubit/features/Project_Arch/data/models/productmodel.dart';

class ApiHelper {
  Future<dynamic> get({required String url, @required String? token}) async {
    Map<String, String> headers = {};

    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response = await http.get(Uri.parse(url), headers: headers);
    print(response.body);
    if (response.statusCode == 201 || response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      // throw Exception(
      //     'there is a problem with status code ${response.statusCode}');

      SnackBar(
          content: Text(
              " 'there is a problem with status code ${response.statusCode}"));
    }
  }

  Future<void> delete({required Url}) async {
    final url = Uri.parse('$Url');

    try {
      final response = await http.delete(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Product deleted successfully');
      } else {
        print('Failed to delete product: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error deleting product: $e');
    }
  }

  Future<dynamic> Post(Model, {required Url}) async {
    final url = Uri.parse('$Url');

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(Model.toJson()),
    );

    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 400) {
      // Handle successful response
      print(jsonEncode(Model.toJson()));
      return jsonDecode(response.body);
    }
  }

  Future<dynamic> update(
    ProductModel model, {
    required String url,
  }) async {
    final Uri uri = Uri.parse(url);

    try {
      final response = await http.patch(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(model.toJson()),
      );
      print(response.statusCode);
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(jsonEncode(model.toJson()));
        print('Product updated successfully');
        return jsonDecode(response.body);
      } else {
        print('Failed to update product: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error updating product: $e');
    }
  }
}
