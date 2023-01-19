class User {
  String name;
  String email;

  User({
    required this.name,
    required this.email,
  });

  User.fromJson(Map json)
      : name = json['name'],
        email = json['email'];
}
