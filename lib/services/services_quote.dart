part of 'services.dart';

class ServicesQuote with ChangeNotifier {
  final String token = '';
  // static Future<List<dynamic>> getQuotes(String page) async {
  static Future<List<dynamic>> getQuotes(String page) async {
    var url = Uri.parse('${baseUrl}quote?page=$page');

    List<Quote> quotes = [];
    List<dynamic> quotesServices = [];

    final prefs = await SharedPreferences.getInstance();
    const key = "token";
    final token = prefs.get(key);
    final headers = {
      'Authorization': 'Bearer $token',
      'Accept': accept,
    };
    final response = await get(url, headers: headers);
    // print(response.body);
    if (response.statusCode == 200) {
      var jsonObject = json.decode(response.body);
      List<dynamic> listQuotes = (jsonObject as Map<String, dynamic>)['data'];

      var page = jsonObject['meta'];

      List listPage = page.values.toList();

      for (var quote in listQuotes) {
        quotes.add(Quote.fromJson(quote));
        // print(quotes);
      }

      quotesServices.add(quotes);
      quotesServices.add(listPage[2]);
      // print(quotesServices[0]);
    }
    return quotesServices;
  }

  Future<Response> addQuote(String author, String quote) async {
    final url = Uri.parse('${baseUrl}quote');
    SharedPreferences pref = await SharedPreferences.getInstance();
    const key = 'token';
    final value = pref.get(key);
    final token = value;
    final body = {'author': author, 'text': quote};
    final headers = {
      'Accept': accept,
      'Authorization': 'Bearer $token',
    };

    final response = await post(url, body: body, headers: headers);
    return response;
  }

  Future<Response> editCategori(Quote quote, String text, String author) async {
    final url = Uri.parse('${baseUrl}quote/${quote.id}');
    SharedPreferences pref = await SharedPreferences.getInstance();
    const key = 'token';
    final value = pref.get(key);
    final token = value;
    final body = {'text': text, 'author': author};
    final headers = {
      'Accept': accept,
      'Authorization': 'Bearer $token',
    };

    final response = await put(url, body: body, headers: headers);
    return response;
  }

  Future<Response> deleteQuote(Quote quote) async {
    final url = Uri.parse('${baseUrl}quote/${quote.id}');
    SharedPreferences pref = await SharedPreferences.getInstance();
    const key = 'token';
    final value = pref.get(key);
    final token = value;
    final headers = {
      'Accept': accept,
      'Authorization': 'Bearer $token',
    };

    final response = await delete(url, headers: headers);
    return response;
  }
}
