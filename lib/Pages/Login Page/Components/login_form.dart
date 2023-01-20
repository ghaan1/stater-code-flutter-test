import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:startercodepacitan/Pages/Registers%20Page/registers_page.dart';
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
    final response = await ServicesAuth().login(email, password, deviceId);
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
    ServicesAuth auth = Provider.of<ServicesAuth>(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          color: kLightColor,
          padding: const EdgeInsets.all(30),
          //margin: EdgeInsets.all(8),
          child: Column(
            children: [
              const Expanded(
                flex: 3,
                child: Text(
                  'Login',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: kPrimaryColor,
                      fontFamily: 'nunito'),
                ),
              ),
              Expanded(
                flex: 5,
                child: Column(
                  children: [
                    TextFormField(
                      controller: txtEmail,
                      decoration: InputDecoration(
                        errorText: validateEmail(txtEmail.text),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 17),
                        filled: true,
                        fillColor: Colors.white,
                        labelText: 'Email',
                        labelStyle: const TextStyle(
                            color: Color(0xFF6777EE),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Nunito'),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 3, color: Color(0xFF6777EE)),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 3, color: Color(0xFF6777EE)),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: txtPassword,
                      decoration: InputDecoration(
                        errorText: validatePassword(txtPassword.text),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 17),
                        filled: true,
                        fillColor: Colors.white,
                        labelText: 'Password',
                        labelStyle: const TextStyle(
                            color: Color(0xFF6777EE),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Nunito'),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 3, color: Color(0xFF6777EE)),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 3, color: Color(0xFF6777EE)),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    SizedBox(
                      child: TextButton(
                        child: const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Lupa Password ?',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontFamily: 'nunito',
                                fontWeight: FontWeight.bold,
                                color: kPrimaryColor),
                          ),
                        ),
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF6777EE),
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                          ),
                          onPressed: () {
                            doLogin();
                          },
                          child: const Text("Login",
                              style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.bold))),
                    ),
                    SizedBox(
                      child: TextButton(
                        child: const Text(
                          'Belum punya akun?',
                          style: TextStyle(
                              fontFamily: 'nunito',
                              fontWeight: FontWeight.bold,
                              color: kPrimaryColor),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const RegisterPages();
                              },
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
