part of 'services.dart';

class ServicesAuth {
  static Future<http.Response> login(
      String email, String password, String deviceId) async {
    Map data = {
      "email": email,
      "password": password,
      "device_name": "android",
    };
    var body = json.encode(data);
    var url = Uri.parse('${baseUrl}login');

    final header1 = {
      "Accept": accept,
      "Content-Type": accept,
      "Access-Control_Allow_Origin": "*"
    };

    http.Response response = await http.post(
      url,
      headers: header1,
      body: body,
    );

    Map<String, dynamic> responseJson = json.decode(response.body);

    if (response.statusCode == 200) {
      SharedPreferences sp = await SharedPreferences.getInstance();

      sp.setString("token", responseJson['token']);

      print(sp.getString("token"));
    }

    _save('token', responseJson['token']);
    _save('name', responseJson['name']);
    _save('email', responseJson['email']);
    return response;
  }

  static Future<http.Response> logout(String token) async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    var url = Uri.parse('${baseUrl}logout');

    final header = {
      'Authorization': 'Bearer $token',
    };

    http.Response response = await http.post(
      url,
      headers: header,
    );

    sp.remove("token");

    return response;
  }

  static Future<http.Response> register(String name, String email,
      String password, String passwordConfirmation, String deviceId) async {
    final url = Uri.parse('${baseUrl}register');

    final body = {
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': passwordConfirmation,
      'device_name': deviceId,
    };
    final headers = {
      'Accept': accept,
    };

    final response = await post(url, body: body, headers: headers);
    return response;
  }

  static _save(String key, String data) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, data);
  }
}
