import 'package:flutter/foundation.dart';
import 'package:startercodepacitan/models/models_quote.dart';
import 'package:startercodepacitan/services/services.dart';

class QouteListProvider with ChangeNotifier {
  List<String> user = [];
  List<Quote> quotes = [];
  int selectedIndex = 0;
  int currentPage = 1;
  int totalPage = 0;
  String author = '';

  int lastPage = 0;
  bool isLoading = true;

  fetchData() {
    ServicesQuote().listQuote(currentPage.toString()).then((resultList) {
      quotes = resultList[0];
      lastPage = resultList[1];
      isLoading = false;
      notifyListeners();
    });
  }

  addMoreData() {
    ServicesQuote().listQuote(currentPage.toString()).then((resultList) {
      quotes.addAll(resultList[0]);
      lastPage = resultList[1];
      isLoading = false;
      notifyListeners();
    });
  }
}
