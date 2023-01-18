import 'package:flutter/material.dart';

class WelcomeImage extends StatelessWidget {
  const WelcomeImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "WELCOME TO STISLA",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 200),
        Row(
          children: [
            Spacer(),
            Expanded(
              flex: 8,
              child: Image.asset(
                "lib/images/logoSteisla.png",
                height: 150,
              ),
            ),
            Spacer(),
          ],
        ),
        SizedBox(height: 200),
      ],
    );
  }
}
