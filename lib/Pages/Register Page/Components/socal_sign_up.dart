import 'package:flutter/material.dart';
import 'package:startercodepacitan/Pages/Register%20Page/Components/social_icon.dart';

import 'or_divider.dart';

class SocalSignUp extends StatelessWidget {
  const SocalSignUp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const OrDivider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          // children: <Widget>[
          //   SocalIcon(
          //     iconSrc: "assets/icons/facebook.svg",
          //     press: () {},
          //   ),
          //   SocalIcon(
          //     iconSrc: "assets/icons/twitter.svg",
          //     press: () {},
          //   ),
          //   SocalIcon(
          //     iconSrc: "assets/icons/google-plus.svg",
          //     press: () {},
          //   ),
          // ],
        ),
      ],
    );
  }
}
