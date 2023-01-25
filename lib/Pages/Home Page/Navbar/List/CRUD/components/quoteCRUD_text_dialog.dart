import 'package:flutter/material.dart';

class TextHeaderDialog extends StatelessWidget {
  String text = '';
  TextHeaderDialog({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: 'Nunito',
            fontWeight: FontWeight.bold));
  }
}
