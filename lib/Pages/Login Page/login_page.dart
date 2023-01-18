import 'package:flutter/material.dart';
import 'package:startercodepacitan/Pages/Register%20Page/register_page.dart';

import '../Welcome Page/components/background.dart';
import 'Components/already_have_an_account_acheck.dart';
import 'Components/login_form.dart';
import 'Components/login_screen_top_image.dart';
import 'Components/square_tile.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const LoginScreenTopImage(),
          Row(children: const [
            Spacer(),
            Expanded(
              flex: 8,
              child: LoginForm(),
            ),
            Spacer(),
          ]),
        ]),
      ),
    );
  }
}
