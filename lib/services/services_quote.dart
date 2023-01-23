part of 'services.dart';

class ServicesQuote with ChangeNotifier {
  final String token = '';
  Future<List> listQuote(String page) async {
    // Future<List<dynamic>> getQuotes(String page) async {
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
    http.Response response = await get(url, headers: headers);
    // print(response.body);
    if (response.statusCode == 200) {
      var jsonObject = json.decode(response.body);
      // List listQuotes = (jsonObject as Map<String, dynamic>)['data'];
      var page = jsonObject['meta'];
      List listPage = page.values.toList();
      var listtQuote = jsonObject;
      Quote quotelist = Quote.fromJson(listtQuote);
      saveQuote(quotelist);
      // sp.setString("token", responseJson['token']);
      notifyListeners();

      // for (var quote in listQuotes) {
      //   quotes.add(Quote.fromJson(quote));
      //   // print(quotes);
      // }

      quotesServices.add(quotes);
      quotesServices.add(listPage[2]);
      // print(quotesServices[0]);
    }
    return quotesServices;
  }

  static Future<bool> saveQuote(Quote quotess) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt("id", quotess.id ?? 0);
    prefs.setString("quote", quotess.quote ?? '');
    prefs.setString("token", quotess.author ?? '');

    return true;
  }

  Future<Quote> getQuote() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    const key = 'id';
    const key1 = 'quote';
    const key2 = 'author';

    final value = pref.get(key);
    final value1 = pref.get(key1);
    final value2 = pref.get(key2);

    final id = '$value';
    final quote = '$value1';
    final author = '$value2';

    return Quote(id: 0, quote: quote, author: author);
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
