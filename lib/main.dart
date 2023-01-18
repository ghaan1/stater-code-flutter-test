import 'package:flutter/material.dart';
import 'package:startercodepacitan/Pages/Register%20Page/register_page.dart';

import 'Pages/Login Page/login_page.dart';
import 'Pages/Welcome Page/mainhome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/": (context) => MainHomePage(),
        "/login": (context) => LoginPage(),
        "/register": (context) => RegisterPage(),
        // "/mainhome": (context) => MainHome(),
        // "/mainlist": (context) => MainProfil(),
      },
      title: 'Flutter Stisla',
      theme: ThemeData(
        fontFamily: 'Nunito',
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
