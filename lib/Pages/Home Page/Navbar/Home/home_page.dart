import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/widget_banner.dart';
import 'components/widget_title.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;
  String token = '';
  String name = '';
  getPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      const key = 'token';
      const key1 = 'name';
      final value = pref.get(key);
      final value1 = pref.get(key1);
      token = '$value';
      name = '$value1';
    });
  }

  @override
  void initState() {
    getPref();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: <Widget>[
        SingleChildScrollView(
          child: Column(
            children: [
              WidgetBanner(),
              WidgetTitle(),
            ],
          ),
        ),
      ][currentPageIndex],
    );
  }
}
