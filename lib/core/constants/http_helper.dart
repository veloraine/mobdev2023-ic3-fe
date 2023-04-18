import 'dart:convert';

import 'package:http/http.dart' as http;

Future<http.Response> postIt(String url, Map<String, dynamic> body) async {
  var response =  await http.post(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(body),
  );
  print(response.statusCode);
  print(response.body);
  return response;
}

Future<http.Response> getIt(String url, Map<String, dynamic> params) async {
  var response =  await http.get(
    Uri.parse(url).replace(queryParameters: params),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  print(response.statusCode);
  print(response.body);
  return response;
}