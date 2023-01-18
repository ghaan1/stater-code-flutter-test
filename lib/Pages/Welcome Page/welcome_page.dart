import 'package:flutter/material.dart';
import 'package:startercodepacitan/Pages/Login%20Page/Components/login_form.dart';
import 'package:startercodepacitan/Pages/Login%20Page/login_page.dart';
import 'package:startercodepacitan/constants.dart';
import 'components/custom_button.dart';
import 'components/custom_page_transition.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);
  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 2), vsync: this)
        ..repeat(reverse: true);
  late final Animation<double> _animation =
      CurvedAnimation(parent: _controller, curve: Curves.ease);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(color: kLightColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "STISLA",
              style: TextStyle(
                  color: kPrimaryColor,
                  fontFamily: 'nunito',
                  decoration: TextDecoration.none,
                  letterSpacing: 4),
            ),
            FadeTransition(
              opacity: _animation,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: Image.asset("lib/images/stisla-transparent.png"),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    decoration: const BoxDecoration(color: kLightColor),
                  )
                ],
              ),
            ),
            CustomButton(
              backgroundColor: kPrimaryColor,
              forgroundColor: Colors.white,
              onPressed: () => Navigator.push(
                  context,
                  CustomScaleTransition(
                      nextPageUrl: "/login", nextPage: const LoginPage())),
              title: "Get Started",
            ),
          ],
        ),
      ),
    );
  }
}
