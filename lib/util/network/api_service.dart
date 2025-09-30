import 'dart:convert';

import 'package:http/http.dart' as http;

abstract class ApiService {
  static const baseUrl = "http://31.97.190.94:2100";

  String get apiUrl;

  Future<dynamic> get({
    String endPoint = '',
    Map<String, String>? header,
  }) async {
    var response = await http.get(
      Uri.parse(baseUrl + apiUrl + endPoint),
      headers: header,
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    return null;
  }

  Future<dynamic> post(
    Map<String, dynamic> body, {
    String endPoint = '',
    Map<String, String>? header,
  }) async {
    var response = await http.post(
      Uri.parse(baseUrl + apiUrl + endPoint),
      body: jsonEncode(body),
      headers: header,
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    }
    return null;
  }
}
