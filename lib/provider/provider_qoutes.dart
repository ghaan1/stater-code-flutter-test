import 'package:flutter/foundation.dart';
import 'package:startercodepacitan/models/models_quote.dart';
import 'package:startercodepacitan/services/services.dart';

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
  final _service = ServicesQuote();
  bool isLoading = false;
  List<dynamic> _quote = [];
  List<dynamic> get quote => _quote;

  Future<void> getAllQuote(String pages) async {
    String page = pages;
    isLoading = true;
    notifyListeners();

    final response = await ServicesQuote().getQuotes(page);

    _quote = response;
    isLoading = false;
    notifyListeners();
  }

  // getAllQoutes(Quote _quote) {
  // isLoading = true;
  // notifyListeners();
  // _quote = quote;
  //  final response = await ServicesQuote.getQuotes();
  // _service = response;
  // isLoading = false;
  // notifyListeners();
  // }
}
