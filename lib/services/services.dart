import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'services_auth.dart';

const String baseUrl = "http://192.168.1.4:8000/api/";
const String accept = "application/json";
