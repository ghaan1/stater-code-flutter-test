import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:startercodepacitan/services/services.dart';

import 'Components/bannerprofil.dart';

class MainProfil extends StatefulWidget {
  const MainProfil({super.key});
  @override
  State<MainProfil> createState() => _MainProfilState();
}

class _MainProfilState extends State<MainProfil> {
  int currentPageIndex = 0;
  String token = '';
  String name = '';
  String email = '';

  getPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      const key = 'token';
      const key1 = 'name';
      const key2 = 'email';
      final value = pref.get(key);
      final value1 = pref.get(key1);
      final value2 = pref.get(key2);
      token = '$value';
      name = '$value1';
      email = '$value2';
      txtName.text = name;
      txtToken.text = token;
      txtEmail.text = email;
    });
  }

  @override
  void initState() {
    getPref();
    super.initState();
  }

  logOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.remove("token");
      preferences.clear();
    });
    final token = txtToken.text;
    final response = await ServicesAuth.logout(token);
    print(response.body);
  }

  final txtName = TextEditingController();
  final txtToken = TextEditingController();
  final txtEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: <Widget>[
        Column(
          children: [
            const WidgetBannerProfil(),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(20),
                width: double.infinity,
                child: Column(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          CircleAvatar(
                              backgroundColor: Colors.black,
                              radius: 50,
                              child: Icon(
                                Icons.face_rounded,
                                size: 100,
                              )),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextFormField(
                            readOnly: true,
                            controller: txtName,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 17),
                              filled: true,
                              fillColor: Colors.white,
                              labelText: 'Name',
                              labelStyle: const TextStyle(
                                  color: Color(0xFF6777EE),
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Nunito'),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 3, color: Color(0xFF6777EE)),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 3, color: Color(0xFF6777EE)),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextEmail(txtEmail: txtEmail),
                          const SizedBox(
                            height: 20,
                          ),
                          TextToken(txtToken: txtToken),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF6777EE),
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(13)),
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, "/");
                                logOut();
                              },
                              child: const Text(
                                'LOGOUT',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ][currentPageIndex],
    );
  }
}

class TextToken extends StatelessWidget {
  const TextToken({
    Key? key,
    required this.txtToken,
  }) : super(key: key);

  final TextEditingController txtToken;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      controller: txtToken,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 17),
        filled: true,
        fillColor: Colors.white,
        labelText: 'Token',
        labelStyle: const TextStyle(
            color: Color(0xFF6777EE),
            fontWeight: FontWeight.bold,
            fontFamily: 'Nunito'),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 3, color: Color(0xFF6777EE)),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 3, color: Color(0xFF6777EE)),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}

class TextEmail extends StatelessWidget {
  const TextEmail({
    Key? key,
    required this.txtEmail,
  }) : super(key: key);

  final TextEditingController txtEmail;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      controller: txtEmail,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 17),
        filled: true,
        fillColor: Colors.white,
        labelText: 'Email',
        labelStyle: const TextStyle(
            color: Color(0xFF6777EE),
            fontWeight: FontWeight.bold,
            fontFamily: 'Nunito'),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 3, color: Color(0xFF6777EE)),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 3, color: Color(0xFF6777EE)),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
