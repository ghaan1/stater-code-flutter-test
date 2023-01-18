import 'package:flutter/material.dart';
import '../Login Page/Components/square_tile.dart';
import '../Login Page/login_page.dart';
import '../Welcome Page/components/background.dart';
import 'Components/sign_up_top_image.dart';
import 'Components/signup_form.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  @override
  State<RegisterPage> createState() => _RegisterState();
}

class _RegisterState extends State<RegisterPage> {
  // text editing controllers

  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordconfController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SignUpScreenTopImage(),
            Row(
              children: const [
                Spacer(),
                Expanded(
                  flex: 8,
                  child: SignUpForm(),
                ),
                Spacer(),
              ],
            ),
            // const SocalSignUp()
          ],
        ),
      ),
    );
  }
}
