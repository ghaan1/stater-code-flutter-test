import 'package:flutter/material.dart';

class FormAuthor extends StatelessWidget {
  FormAuthor({super.key, required this.controller});
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        // errorText: validateEmail(txtEmail.text),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 17),
        filled: true,
        fillColor: Colors.white,
        labelText: 'Author Qoutes',
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

class FormQuote extends StatelessWidget {
  TextEditingController controller = TextEditingController();

  FormQuote({super.key, required this.controller});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        // errorText: validateEmail(txtEmail.text),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 50, horizontal: 17),
        filled: true,
        fillColor: Colors.white,
        labelText: 'Isi Qoutes',
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
