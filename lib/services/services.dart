import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:startercodepacitan/Pages/Home%20Page/Navbar/List/CRUD/delete_page.dart';
import 'package:startercodepacitan/models/models_quote.dart';
import 'package:startercodepacitan/models/models_user.dart';

part 'services_auth.dart';
part 'services_quote.dart';

const String baseUrl = "https://80a4-61-5-11-20.ap.ngrok.io/api/";
const String accept = "application/json";
