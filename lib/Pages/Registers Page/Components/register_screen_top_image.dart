import 'package:flutter/material.dart';
import 'package:startercodepacitan/constants.dart';

import '../../Login Page/Components/custom_circle.dart';

class WelcomeStisla extends StatelessWidget {
  const WelcomeStisla({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryColor,
      height: MediaQuery.of(context).size.height * 0.3,
      child: Stack(
        children: [
          Positioned(
              top: MediaQuery.of(context).size.height * 0.03,
              left: MediaQuery.of(context).size.width * 0.25,
              child: const CustomCircle(
                width: 25,
                height: 25,
                color: kPrimaryColor,
              )),
          Positioned(
              top: MediaQuery.of(context).size.height * -0.065,
              right: MediaQuery.of(context).size.width * 0.03,
              child: const CustomCircle(
                width: 125,
                height: 125,
                gradient: circleGradientColor,
                color: circleColor,
                borderWidth: 2,
              )),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          const Align(
            alignment: Alignment.center,
            child: Text(
              "Welcome\nStisla",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 60,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontFamily: 'nunito'),
            ),
          ),
          Positioned(
              bottom: MediaQuery.of(context).size.height * 0.06,
              right: MediaQuery.of(context).size.width * 0.18,
              child: const CustomCircle(
                width: 35,
                height: 35,
                color: kPrimaryColor,
                borderWidth: 4,
              )),
        ],
      ),
    );
  }
}
