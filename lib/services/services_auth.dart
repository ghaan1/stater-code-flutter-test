part of 'services.dart';

enum Status {
  NotLoggedIn,
  NotRegistered,
  LoggedIn,
  Registered,
  Authenticating,
  Registering,
  LoggedOut
}

class ServicesAuth with ChangeNotifier {
  Status _loggedInStatus = Status.NotLoggedIn;
  Status _registeredInStatus = Status.NotRegistered;

  Status get loggedInStatus => _loggedInStatus;
  Status get registeredInStatus => _registeredInStatus;

  Future<http.Response> login(
      String email, String password, String deviceId) async {
    var result;
    Map data = {
      "email": email,
      "password": password,
      "device_name": "android",
    };

    _loggedInStatus = Status.Authenticating;
    notifyListeners();
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

    // _save('token', responseJson['token']);
    // _save('name', responseJson['name']);
    // _save('email', responseJson['email']);

    if (response.statusCode == 200) {
      Map<String, dynamic> responseJson = json.decode(response.body);

      // SharedPreferences sp = await SharedPreferences.getInstance();
      var userData = responseJson;
      User authUser = User.fromJson(userData);
      saveUser(authUser);
      // sp.setString("token", responseJson['token']);
      _loggedInStatus = Status.LoggedIn;
      notifyListeners();
      // print(sp.getString("token"));
      result = {'status': true, 'message': 'Successful', 'user': authUser};
    } else {
      _loggedInStatus = Status.NotLoggedIn;
      notifyListeners();
      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };
    }
    print(result);
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

  _save(String key, String data) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, data);
  }

  Future<bool> saveUser(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString("name", user.name ?? '');
    prefs.setString("email", user.email ?? '');
    prefs.setString("token", user.token ?? '');

    return true;
  }

  Future<User> getUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    const key = 'token';
    const key1 = 'name';
    const key2 = 'email';

    final value = pref.get(key);
    final value1 = pref.get(key1);
    final value2 = pref.get(key2);

    final token = '$value';
    final name = '$value1';
    final email = '$value2';

    return User(name: name, email: email, token: token);
  }

  void removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove("name");
    prefs.remove("email");
    prefs.remove("token");
  }
}
