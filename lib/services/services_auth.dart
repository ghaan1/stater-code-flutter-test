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
    var url = Uri.parse(baseUrl + 'auth/login');

    final header1 = {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Access-Control_Allow_Origin": "*"
    };

    http.Response response = await http.post(
      url,
      headers: header1,
      body: body,
    );

    Map<String, dynamic> responseJson = json.decode(response.body);

    // save token use shared preferences
    if (response.statusCode == 200) {
      SharedPreferences sp = await SharedPreferences.getInstance();

      sp.setString("token", responseJson['token']);

      print(sp.getString("token"));
    }

    return response;
  }
}
