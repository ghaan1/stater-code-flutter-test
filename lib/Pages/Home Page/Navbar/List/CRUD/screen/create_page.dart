import 'package:flutter/material.dart';
import 'package:startercodepacitan/Pages/Home%20Page/Navbar/List/CRUD/components/quoteCRUD_form_field.dart';
import 'package:startercodepacitan/Pages/Home%20Page/Navbar/List/CRUD/components/quoteCRUD_text_dialog.dart';
import 'package:startercodepacitan/services/services.dart';

class TambahQoute extends StatefulWidget {
  const TambahQoute({Key? key}) : super(key: key);

  @override
  State<TambahQoute> createState() => _TambahQouteState();
}

class _TambahQouteState extends State<TambahQoute> {
  final TextEditingController txtAuthor = TextEditingController();
  final TextEditingController txtQuote = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        padding: const EdgeInsets.all(8),
        width: MediaQuery.of(context).size.width / 2.3,
        height: MediaQuery.of(context).size.height / 2.3,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(12, 26),
                  blurRadius: 50,
                  spreadRadius: 0,
                  color: Colors.grey.withOpacity(.1)),
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            TextHeaderDialog(text: 'Tambah Quote'),
            const SizedBox(
              height: 15,
            ),
            FormAuthor(
              controller: txtAuthor,
            ),
            const SizedBox(
              height: 10,
            ),
            FormQuote(
              controller: txtQuote,
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 45,
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6777EE),
                    elevation: 10,
                  ),
                  onPressed: () async {
                    final response = await ServicesQuote()
                        .addQuote(txtAuthor.text, txtQuote.text);
                    print(response.body);
                    Navigator.of(context).pop(false);
                  },
                  child: const Text("Tambah",
                      style: TextStyle(
                          fontFamily: 'Nunito', fontWeight: FontWeight.bold))),
            ),
          ],
        ),
      ),
    );
  }

  // doAddQuote() async {
  //   final response =
  //       await ServicesQuote().addQuote(txtAuthor.text, txtIsiQuote.text);
  //   print(response.body);
  //   Navigator.of(context).pop(false);
  // }
}
