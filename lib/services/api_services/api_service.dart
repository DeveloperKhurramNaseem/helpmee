import 'dart:convert';

import 'package:help_mee/util/network/network_constants.dart';
import 'package:http/http.dart' as http;

abstract class ApiService {
  static const baseUrl = "http://31.97.190.94:2100";

  String get apiUrl;

  Future<DecodedResponse?> get({
    String endPoint = '',
    Map<String, String>? header,
  }) async {
    var response = await http.get(
      Uri.parse(baseUrl + apiUrl + endPoint),
      headers: header,
    );
    if (response.statusCode == 500) {
      return null;
    }
    return decodeResponse(response.body);
  }

  Future<DecodedResponse?> post(
    String endPoint,
    Map<String, dynamic> body, {    
    Map<String, String>? header,
  }) async {
    var response = await http.post(
      Uri.parse(baseUrl + apiUrl + endPoint),
      body: jsonEncode(body),
      headers: header,
    );
    if (response.statusCode == 500) {
      return null;
    }
    return decodeResponse(response.body);
  }
}
