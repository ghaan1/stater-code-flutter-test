class User {
  String? name;
  String? email;
  String? token;

  User({
    this.name,
    this.email,
    this.token,
  });

  User.fromJson(Map json)
      : name = json['name'],
        email = json['email'],
        token = json['token'];
}
