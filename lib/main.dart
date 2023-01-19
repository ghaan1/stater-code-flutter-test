import 'package:flutter/material.dart';
import 'package:startercodepacitan/Pages/Home%20Page/Navbar/Home/home_page.dart';
import 'package:startercodepacitan/Pages/Home%20Page/landinghome_page.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:startercodepacitan/Pages/Registers%20Page/registers_page.dart';

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
        // "/": (context) => LandingHome(),
        "/login": (context) => const LoginPage(),
        "/register": (context) => const RegisterPages(),
        "/mainhome": (context) => const LandingHome(),
        // "/mainlist": (context) => MainProfil(),
      },
      title: 'Flutter Stisla',
      theme: ThemeData(
        fontFamily: 'nunito',
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
