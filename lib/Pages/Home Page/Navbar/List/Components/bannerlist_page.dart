import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WidgetBannerList extends StatefulWidget {
  const WidgetBannerList({Key? key}) : super(key: key);

  @override
  _WidgetBannerListState createState() => _WidgetBannerListState();
}

class _WidgetBannerListState extends State<WidgetBannerList> {
  String name = '';
  getPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      const key = 'token';
      const key1 = 'name';
      final value1 = pref.get(key1);
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
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
          child: Image.asset("lib/images/bg-ungu.jpeg"),
        ),
        SizedBox(
          height: 200,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "List",
                textAlign: TextAlign.center,
                style: TextStyle(
                  letterSpacing: 5,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Kategori',
                style: const TextStyle(
                  letterSpacing: 2,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Nunito',
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
