import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

abstract class ApiService {
  static const baseUrl = "http://31.97.190.94:2100";

  String get apiUrl;

  Future<String?> get({
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
    return response.body;
  }

  Future<String?> post(
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
    return response.body;
  }

    Future<String?> put(
    String endPoint,
    Map<String, dynamic> body, {    
    Map<String, String>? header,
  }) async {
    var response = await http.put(
      Uri.parse(baseUrl + apiUrl + endPoint),
      body: jsonEncode(body),
      headers: header,
    );
    if (response.statusCode == 500) {
      return null;
    }
    return response.body;
  }

    Future<String?> postWithFile(
    String endPoint,
    Map<String, dynamic> body, String fieldKey , File file ,{    
    Map<String, String>? header,
  }) async {

    var request = http.MultipartRequest('POST', Uri.parse(baseUrl + apiUrl + endPoint));
    request.files.add(http.MultipartFile.fromBytes(fieldKey, file.readAsBytesSync(), filename: file.path.split('/').last));
    request.fields.addAll(body.map((key,value) => MapEntry(key, value.toString())));

    request.headers.addAll(header ?? {});
    var response = await request.send();
    if (response.statusCode == 500) {
      return null;
    }
    return await response.stream.bytesToString();
  }

  Future<String?> delete(
    String endPoint,    {    
      Map<String, dynamic>? body, 
    Map<String, String>? header,
  }) async {
    var response = await http.delete(
      Uri.parse(baseUrl + apiUrl + endPoint),
      body: jsonEncode(body),
      headers: header,
    );
    if (response.statusCode == 500) {
      return null;
    }
    return response.body;
  }
}
