import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:startercodepacitan/Pages/Home%20Page/Navbar/Home/home_page.dart';
import 'package:startercodepacitan/Pages/Home%20Page/landinghome_page.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:startercodepacitan/Pages/Registers%20Page/registers_page.dart';
import 'package:startercodepacitan/models/models_user.dart';
import 'package:startercodepacitan/provider/provider_user.dart';
import 'package:startercodepacitan/services/services.dart';

import 'Pages/Login Page/login_page.dart';
import 'Pages/Welcome Page/mainhome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Future<User> getUserData() => ServicesAuth().getUser();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ServicesAuth()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MaterialApp(
        home: FutureBuilder(
            future: getUserData(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return CircularProgressIndicator();
                default:
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.data!.token == null) {
                    return const LoginPage();
                  } else {
                    ServicesAuth().removeUser();
                  }
                  return MainHomePage(user: snapshot.data!);
              }
            }),
        routes: {
          // "/": (context) => MainHomePage(),
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
      ),
    );
  }
}
