import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const String url = "http://192.168.137.101:8000/api/v1/auth/adminLogin";
Future<String> Login(String email, String pass) async {
  var response = await http.post(Uri.parse("$url/v1/uth/adminlogin"),
      body: jsonEncode({"email": email, "password": pass}));
  return response.body;
}
