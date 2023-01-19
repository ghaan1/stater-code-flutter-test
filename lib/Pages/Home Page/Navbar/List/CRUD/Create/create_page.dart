import 'package:flutter/material.dart';
import 'package:startercodepacitan/Pages/Home%20Page/landinghome_page.dart';
// import 'package:stislaflutter/api/crud_helper.dart';

class TambahQoute extends StatefulWidget {
  const TambahQoute({Key? key}) : super(key: key);

  @override
  State<TambahQoute> createState() => _TambahQouteState();
}

class _TambahQouteState extends State<TambahQoute> {
  final TextEditingController txtAddCategory = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.4,
        height: MediaQuery.of(context).size.height / 2.667,
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
                controller: txtAddCategory,
                decoration: InputDecoration(
                  // errorText: validateEmail(txtEmail.text),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 17),
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Judul Qoutes',
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
                controller: txtAddCategory,
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
                    // doAddCategory();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const LandingHome();
                        },
                      ),
                    );
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
  //  doAddCategory() async{
  //   final name = txtAddCategory.text;
  //   final response = await CrudHelper().addCategory(name);
  //   print(response.body);
  //    Navigator.of(context).pop(false);
  // }
}
