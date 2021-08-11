import 'package:api_test/model/image_result.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
// dart 2.13.0
typedef Json = Map<String, dynamic>;

class PixabayRepository {
  final baseUrl = 'https://pixabay.com/api/';

  Future<List<ImageResult>> fetch({String? query}) async {
    final url = Uri.parse(
        '$baseUrl?key=17828481-17c071c7f8eadf406822fada3&q=${query ?? 'iPhone'}&image_type=photo');

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonResponse =
      convert.jsonDecode(response.body) as Map<String, dynamic>;

      final Iterable hits = jsonResponse['hits'];

      return hits.map((e) => ImageResult.fromJson(e)).toList();
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

    return [];
  }
}