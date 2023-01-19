import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:startercodepacitan/Pages/Home%20Page/Navbar/List/CRUD/delete_page.dart';
import 'package:startercodepacitan/models/models_quote.dart';

part 'services_auth.dart';
part 'services_quote.dart';

const String baseUrl = "http://192.168.1.4:8000/api/";
const String accept = "application/json";
