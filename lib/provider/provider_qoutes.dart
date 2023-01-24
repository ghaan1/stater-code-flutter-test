import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:startercodepacitan/models/models_quote.dart';
import 'package:startercodepacitan/services/services.dart';
import 'package:http/http.dart' as http;
import 'dart:developer';
import 'dart:async';
import 'dart:convert';
import 'dart:developer';

class QouteListProvider with ChangeNotifier {
  // final _service = ServicesQuote();
  // int selectedIndex = 0;
  // int currentPage = 1;
  // bool isLoading = false;
  // final Quote _qoute = Quote();
  // List<Quote> _quote = Quote();
  // final Quote _qoute = Quote();
  // Quote get quote => _qoute;
  // List<Quote> get todos => _qoute;
  // final _service = ServicesQuote();
  // bool isLoading = false;
  // List<dynamic> _quote = [];
  // List<dynamic> get quote => _quote;

  // Future<void> getAllQuote(String pages) async {
  //   String page = pages;
  //   isLoading = true;
  //   notifyListeners();

  //   final response = await ServicesQuote().getQuotes(page);

  //   _quote = response;
  //   isLoading = false;
  //   notifyListeners();
  // }

  // getAllQoutes(Quote _quote) {
  // isLoading = true;
  // notifyListeners();
  // _quote = quote;
  //  final response = await ServicesQuote.getQuotes();
  // _service = response;
  // isLoading = false;
  // notifyListeners();
  // }
  ResponseData responseData = ResponseData();
  // List quotes = [];

  bool isLoading = false;

  getMyData(int page) async {
    isLoading = true;
    responseData = await getAllData(page);
    isLoading = false;
    notifyListeners();
  }

  Future<ResponseData> getAllData(int page) async {
    try {
      // var url = Uri.parse("http://192.168.2.253:8000/api/quote?page=1");
      var url = Uri.parse('http://192.168.2.253:8000/api/quote?page=$page');

      final prefs = await SharedPreferences.getInstance();
      const key = "token";
      final token = prefs.get(key);
      final headers = {
        'Authorization': 'Bearer $token',
        'Accept': accept,
      };
      http.Response response = await get(url, headers: headers);

      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        responseData = ResponseData.fromJson(item);

        // List<dynamic> listQuotes = (item as Map<String, dynamic>)['data'];
        // var page = item['meta'];
        // List listPage = page.values.toList();

        // for (var quote in listQuotes) {
        // quotes.add(Quote.fromJson(quote));
        // responseData.data?.add(quote);
        // }

        notifyListeners();
      } else {
        print("else");
      }
    } catch (e) {
      log(e.toString());
    }

    return responseData;
  }
}
