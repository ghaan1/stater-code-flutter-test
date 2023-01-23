import 'package:flutter/foundation.dart';

import '../models/models_user.dart';

class UserProvider with ChangeNotifier {
  User _user = User();

  User get user => _user;

  void setUser(User user) {
    _user = user;
    // notifyListeners();
  }
}
