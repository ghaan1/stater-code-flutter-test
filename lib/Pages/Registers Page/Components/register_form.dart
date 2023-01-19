import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:startercodepacitan/Pages/Login%20Page/login_page.dart';

import 'package:startercodepacitan/services/services.dart';
import '../../../constants.dart';
import '../../Home Page/landinghome_page.dart';

class RegisterFrom extends StatefulWidget {
  const RegisterFrom({
    Key? key,
  }) : super(key: key);

  @override
  _PageRegisterState createState() => _PageRegisterState();
}

// class HeadClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     path.lineTo(0, size.height);
//     path.quadraticBezierTo(
//         size.width / 4, size.height - 40, size.width / 2, size.height - 20);
//     path.quadraticBezierTo(
//         3 / 4 * size.width, size.height, size.width, size.height - 30);
//     path.lineTo(size.width, 0);

//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     throw UnimplementedError();
//   }
// }

class _PageRegisterState extends State<RegisterFrom> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var txtUsername = TextEditingController(text: 'bili yasimaru');
  var txtEmail = TextEditingController(text: 'superadmin@gmail.com');
  var txtPassword = TextEditingController(text: 'password');
  var txtPasswordConf = TextEditingController(text: 'password');

  String? _usernameResponseError;
  String? _emailResponseError;
  String? _passwordResponseError;
  String? _passwordConfResponseError;
  int? _statusCode;

  String? validateUsername(String value) {
    if (!value.isNotEmpty) {
      return "Username Masih Kosong";
    } else if (_statusCode != 200) {
      return _usernameResponseError;
    }
    return null;
  }

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

  String? validatePasswordConf(String value) {
    if (!value.isNotEmpty) {
      return "Password Masih Kosong";
    } else if (_statusCode != 200) {
      return _passwordConfResponseError;
    }
    return null;
  }

  Future doRegister() async {
    final username = txtUsername.text;
    final email = txtEmail.text;
    final password = txtPassword.text;
    final passwordconf = txtPasswordConf.text;
    const deviceId = "12345";
    final response = await ServicesAuth.register(
        username, email, password, passwordconf, deviceId);
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
          _usernameResponseError = errors['username'][0];
          _emailResponseError = errors['email'][0];
          _passwordResponseError = errors['password'][0];
          _passwordConfResponseError = errors['passwordconfrim'][0];
        } else {
          if (errors.containsKey('email')) {
            _emailResponseError = errors['email'][0];
          } else if (errors.containsKey('username')) {
            _usernameResponseError = errors['username'][0];
          } else {
            _passwordResponseError = errors['password'][0];
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          color: kLightColor,
          padding: const EdgeInsets.all(30),
          //margin: EdgeInsets.all(8),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Register',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: kPrimaryColor,
                    fontFamily: 'nunito'),
              ),
              Column(
                children: [
                  TextFormField(
                    controller: txtUsername,
                    decoration: InputDecoration(
                      errorText: validateUsername(txtUsername.text),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 17),
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Username',
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
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: txtPasswordConf,
                    decoration: InputDecoration(
                      errorText: validatePasswordConf(txtPasswordConf.text),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 17),
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Password Confirmasi',
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
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
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
                          doRegister();
                        },
                        child: const Text("Register",
                            style: TextStyle(
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.bold))),
                  ),
                  SizedBox(
                    child: TextButton(
                      child: const Text(
                        'Sudah punya akun?',
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
                              return const LoginPage();
                            },
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
