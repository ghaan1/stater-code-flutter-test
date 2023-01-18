import 'package:flutter/material.dart';

class WidgetTitle extends StatefulWidget {
  const WidgetTitle({Key? key}) : super(key: key);

  @override
  _WidgetTitleState createState() => _WidgetTitleState();
}

class _WidgetTitleState extends State<WidgetTitle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text("Mau Ngapain Nich :) ?",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold)),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
