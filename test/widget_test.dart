// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:convert';

import 'package:api_test/pix_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart'as http;
import 'package:api_test/main.dart';


void main() {
  test('http 통신 테스트', () async {
    var uri = Uri.parse(
        'https://pixabay.com/api/?key=17828481-17c071c7f8eadf406822fada3&q=iphone&image_type=photo');
    var response = await http. get (uri);
    expect(response.statusCode, 200);
    Pix_model result = Pix_model.fromJson(json.decode(response.body));
    expect(result.hits![0].id, 336378);
  });
}