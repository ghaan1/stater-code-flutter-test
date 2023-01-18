import 'package:flutter/material.dart';
import 'package:startercodepacitan/Pages/Welcome%20Page/welcome_page.dart';

import '../../constants.dart';
import 'components/login_signup_btn.dart';
import 'components/welcome_image.dart';

class MainHomePage extends StatelessWidget {
  MainHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stisla',
      theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              primary: kPrimaryColor,
              shape: const StadiumBorder(),
              maximumSize: const Size(double.infinity, 56),
              minimumSize: const Size(double.infinity, 56),
            ),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            fillColor: kPrimaryColor,
            iconColor: kPrimaryColor,
            prefixIconColor: kPrimaryColor,
            contentPadding: EdgeInsets.symmetric(
                horizontal: defaultPadding, vertical: defaultPadding),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide.none,
            ),
          )),
      home: const WelcomePage(),
    );
  }
}
