import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:startercodepacitan/Pages/Register%20Page/register_page.dart';
import 'package:startercodepacitan/services/services.dart';
import '../../../constants.dart';
import '../../Home Page/landinghome_page.dart';
import 'already_have_an_account_acheck.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  _PageLoginState createState() => _PageLoginState();
}

class HeadClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 4, size.height - 40, size.width / 2, size.height - 20);
    path.quadraticBezierTo(
        3 / 4 * size.width, size.height, size.width, size.height - 30);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    throw UnimplementedError();
  }
}

class _PageLoginState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var txtEmail = TextEditingController(text: 'superadmin@gmail.com');
  var txtPassword = TextEditingController(text: 'password');

  String? _emailResponseError;
  String? _passwordResponseError;
  int? _statusCode;

  String? validateEmail(String value) {
    if (!value.isNotEmpty) {
      return "Email Masih Kosong";
    } else if (!value.contains('@')) {
      return "Kurang @";
    } else if (_statusCode != 200) {
      return _emailResponseError;
    }
    return null;
  }

  String? validatePassword(String value) {
    if (!value.isNotEmpty) {
      return "Password Masih Kosong";
    } else if (_statusCode != 200) {
      return _passwordResponseError;
    }
    return null;
  }

  Future doLogin() async {
    final email = txtEmail.text;
    final password = txtPassword.text;
    const deviceId = "12345";
    final response = await ServicesAuth.login(email, password, deviceId);
    print(response.body);
    _statusCode = response.statusCode;

    SharedPreferences pref = await SharedPreferences.getInstance();
    const key = 'token';
    final token = pref.get(key);
    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const LandingHome();
          },
        ),
      );
    } else if (response.statusCode == 422) {
      var object = json.decode(response.body);
      var errors = object['errors'];
      setState(() {
        if (errors.length > 1) {
          _emailResponseError = errors['email'][0];
          _passwordResponseError = errors['password'][0];
        } else {
          if (errors.containsKey('email')) {
            _emailResponseError = errors['email'][0];
          } else {
            _passwordResponseError = errors['password'][0];
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            controller: txtEmail,
            onSaved: (String? val) {
              txtEmail.text = val!;
            },
            decoration: const InputDecoration(
              hintText: "Your email",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              textInputAction: TextInputAction.done,
              obscureText: true,
              controller: txtPassword,
              onSaved: (String? val) {
                txtPassword.text = val!;
              },
              cursorColor: kPrimaryColor,
              decoration: const InputDecoration(
                hintText: "Your password",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          Hero(
            tag: "login_btn",
            child: ElevatedButton(
              // onPressed: () => _validateInput(),
              onPressed: () {
                doLogin();
              },
              child: Text(
                "Login".toUpperCase(),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const RegisterPage();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
