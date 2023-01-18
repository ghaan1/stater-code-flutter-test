import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:startercodepacitan/Pages/Login%20Page/login_page.dart';
import 'package:startercodepacitan/services/services.dart';
import '../../../constants.dart';
import '../../Login Page/Components/already_have_an_account_acheck.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpForm> createState() => _PageRegisterState();
}

class _PageRegisterState extends State<SignUpForm> {
  String? _nameResponseError;
  String? _emailResponseError;
  String? _passwordResponseError;
  int? _statusCode;
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  TextEditingController txtName =
      TextEditingController(text: "Ariq Luthfi Rifqi");
  TextEditingController txtEmail =
      TextEditingController(text: 'tester2@gmail.com');
  TextEditingController txtPassword = TextEditingController(text: 'password');
  TextEditingController txtPasswordConfirmation =
      TextEditingController(text: 'password');
  TextEditingController txtDeviceName = TextEditingController(text: 'laptop');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  String? validateName(String value) {
    if (!value.isNotEmpty) {
      return "Nama Masih Kosong";
    } else if (_statusCode != 200) {
      return _nameResponseError;
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

  String? validatePasswordConfirmation(String value) {
    if (!value.isNotEmpty) {
      return "Password Masih Kosong";
    } else if (_statusCode != 200) {
      return _passwordResponseError;
    }
    return null;
  }

  doRegister() async {
    final name = txtName.text;
    final email = txtEmail.text;
    final password = txtPassword.text;
    final passwordConfirmation = txtPasswordConfirmation.text;
    final deviceId = txtDeviceName.text;
    final response = await ServicesAuth.register(
        name, email, password, passwordConfirmation, deviceId);
    print(response.body);
    _statusCode = response.statusCode;
    if (response.statusCode == 200) {
      Navigator.pushNamed(context, '/');
    } else if (response.statusCode == 422) {
      var object = json.decode(response.body);
      var errors = object['errors'];
      setState(() {
        if (errors.length > 1) {
          _nameResponseError = errors['name'][0];
          _emailResponseError = errors['email'][0];
          _passwordResponseError = errors['password'][0];
        } else {
          if (errors.containsKey('name')) {
            _nameResponseError = errors['name'][0];
          } else if (errors.containsKey('email')) {
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
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            controller: txtName,
            decoration: InputDecoration(
              hintText: "Your Name",
              prefixIcon: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              controller: txtEmail,
              decoration: InputDecoration(
                hintText: "Your email",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.person),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kPrimaryColor,
              controller: txtPassword,
              decoration: InputDecoration(
                hintText: "Your password",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kPrimaryColor,
              controller: txtPasswordConfirmation,
              decoration: InputDecoration(
                hintText: "Confirmasi password",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              controller: txtDeviceName,
              decoration: InputDecoration(
                hintText: "Your Device Name",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.device_hub),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding / 2),
          ElevatedButton(
            onPressed: () {
              doRegister();
            },
            child: Text("Sign Up".toUpperCase()),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginPage();
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
