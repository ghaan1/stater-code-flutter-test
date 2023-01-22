import 'package:flutter/material.dart';
import 'package:startercodepacitan/Pages/Home%20Page/landinghome_page.dart';
import 'package:startercodepacitan/models/models_quote.dart';
import 'package:startercodepacitan/services/services.dart';
// import 'package:stislaflutter/api/crud_helper.dart';

class EditQoute extends StatefulWidget {
  Quote quote;
  EditQoute({Key? key, required this.quote}) : super(key: key);

  @override
  State<EditQoute> createState() => _EditQouteState();
}

class _EditQouteState extends State<EditQoute> {
  @override
  void initState() {
    super.initState();
    // txtAuthor.text = widget.quote.author;
    // txtIsiQuote.text = widget.quote.quote;
  }

  final TextEditingController txtAuthor = TextEditingController();
  final TextEditingController txtIsiQuote = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        padding: EdgeInsets.all(8),
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
            const Text("Tambah Qoutes",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 15,
            ),
            Container(
              child: TextFormField(
                controller: txtAuthor,
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
                    borderSide:
                        const BorderSide(width: 3, color: Color(0xFF6777EE)),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 3, color: Color(0xFF6777EE)),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: TextFormField(
                controller: txtIsiQuote,
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
                    borderSide:
                        const BorderSide(width: 3, color: Color(0xFF6777EE)),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 3, color: Color(0xFF6777EE)),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            // ignore: prefer_const_constructors
            SizedBox(
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
                  onPressed: () {
                    doEditQuote();
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) {
                    //       return const LandingHome();
                    //     },
                    //   ),
                    // );
                  },
                  child: const Text("Edit",
                      style: TextStyle(
                          fontFamily: 'Nunito', fontWeight: FontWeight.bold))),
            ),
          ],
        ),
      ),
    );
  }

  doEditQuote() async {
    final response = await ServicesQuote()
        .editCategori(widget.quote!, txtIsiQuote.text, txtAuthor.text);
    print(response.body);
    Navigator.of(context).pop(false);
  }
}
