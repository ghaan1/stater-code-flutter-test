import 'package:flutter/foundation.dart';
import 'package:startercodepacitan/models/models_quote.dart';
import 'package:startercodepacitan/services/services.dart';
import '../models/models_user.dart';

class QouteListProvider with ChangeNotifier {
  final _service = ServicesQuote();
  int selectedIndex = 0;
  int currentPage = 1;
  bool isLoading = false;
  List<Quote> _qoute = [];
  List<Quote> get todos => _qoute;

  Future<void> getAllQoutes() async {
    isLoading = true;
    notifyListeners();

    final response = await ServicesQuote.getQuotes();

    _service = response;
    isLoading = false;
    notifyListeners();
  }
}
