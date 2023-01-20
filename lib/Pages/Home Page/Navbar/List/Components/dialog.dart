import 'package:flutter/material.dart';

import '../../../../../models/models_quote.dart';

class DialogList extends StatefulWidget {
  Quote quote;
  DialogList({
    Key? key,
    required this.quote,
  }) : super(key: key);
  @override
  State<DialogList> createState() => _DialogListState();
}

class _DialogListState extends State<DialogList> {
  String text = '';

  @override
  void initState() {
    super.initState();
    text = widget.quote!.quote;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.4,
        height: MediaQuery.of(context).size.height / 7,
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
            const Text("Detail",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 15,
            ),
            Text(
              text,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Color(0xFF6777EE),
              ),
            )
          ],
        ),
      ),
    );
  }
}
