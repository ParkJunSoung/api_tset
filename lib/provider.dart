import 'dart:convert';

import 'package:api_test/pix_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PixInfo extends ChangeNotifier {
  final controller = TextEditingController();
  Pix_model? _result;

  Pix_model? get result => _result;

  Future<Pix_model?> fetchData() async {
    var uri = Uri.parse(
        'https://pixabay.com/api/?key=17828481-17c071c7f8eadf406822fada3&q=iphone&image_type=photo');
    var response = await http.get(uri);
    Pix_model result = Pix_model.fromJson(json.decode(response.body));
    this._result = result;
    notifyListeners();
  }
}