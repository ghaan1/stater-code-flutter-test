import 'package:flutter/material.dart';
import 'package:startercodepacitan/Pages/Register%20Page/register_page.dart';
import 'package:startercodepacitan/Pages/Registers%20Page/Components/register_screen_top_image.dart';

import '../Welcome Page/components/background.dart';
import 'Components/register_form.dart';

class RegisterPages extends StatefulWidget {
  const RegisterPages({super.key});
  @override
  State<RegisterPages> createState() => _RegisterState();
}

class _RegisterState extends State<RegisterPages> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserUp() {}

  @override
  Widget build(BuildContext context) {
    return Column(
        children: const [WelcomeStisla(), Expanded(child: RegisterFrom())]);
  }
}
