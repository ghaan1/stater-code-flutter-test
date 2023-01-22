import 'package:flutter/foundation.dart';
import 'package:startercodepacitan/models/models_quote.dart';

class QouteListProvider with ChangeNotifier {
  // final _service = ServicesQuote();
  // int selectedIndex = 0;
  // int currentPage = 1;
  // bool isLoading = false;
  // List<Quote> _qoute = [];
  Quote _quote = Quote();
  Quote get quote => _quote;
  // List<Quote> get todos => _qoute;

  void getAllQoutes(Quote quote) {
    // isLoading = true;
    // notifyListeners();
    _quote = quote;
    //  final response = await ServicesQuote.getQuotes();
    // _service = response;
    // isLoading = false;
    notifyListeners();
  }
}
