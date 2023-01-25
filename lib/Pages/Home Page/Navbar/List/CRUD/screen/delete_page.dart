import 'package:flutter/material.dart';
import 'package:startercodepacitan/Pages/Home%20Page/Navbar/List/CRUD/components/quoteCRUD_text_dialog.dart';
import 'package:startercodepacitan/models/models_quote.dart';
import 'package:startercodepacitan/services/services.dart';

class DeleteQuote extends StatefulWidget {
  Quote quote;
  DeleteQuote({
    Key? key,
    required this.quote,
  }) : super(key: key);

  @override
  State<DeleteQuote> createState() => _DeleteQuoteState();
}

class _DeleteQuoteState extends State<DeleteQuote> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.4,
        height: MediaQuery.of(context).size.height / 4.667,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: const [
              BoxShadow(
                  offset: Offset(12, 26),
                  blurRadius: 50,
                  spreadRadius: 0,
                  color: Colors.white),
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            TextHeaderDialog(text: 'Delete Quote'),
            const SizedBox(
              height: 15,
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 45,
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                        onPressed: () {
                          doDeleteQuote();
                        },
                        child: const Text("Ya",
                            style: TextStyle(
                                fontFamily: 'Nunito',
                                color: Colors.black,
                                fontWeight: FontWeight.bold))),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 45,
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        child: const Text("Tidak",
                            style: TextStyle(
                                fontFamily: 'Nunito',
                                color: Colors.black,
                                fontWeight: FontWeight.bold))),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  doDeleteQuote() async {
    final response = await ServicesQuote().deleteQuote(widget.quote!);
    print(response.body);
    Navigator.of(context).pop(false);
  }
}
