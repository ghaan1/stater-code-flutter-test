import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:startercodepacitan/Pages/Home%20Page/Navbar/List/CRUD/components/quoteCRUD_form_field.dart';

import 'package:startercodepacitan/Pages/Home%20Page/Navbar/List/CRUD/screen/create_page.dart';
import 'package:startercodepacitan/Pages/Home%20Page/Navbar/List/CRUD/screen/delete_page.dart';
import 'package:startercodepacitan/Pages/Home%20Page/Navbar/List/CRUD/screen/edit_page.dart';
import 'package:startercodepacitan/provider/provider_qoutes.dart';

import 'Components/bannerlist_page.dart';
import 'CRUD/components/dialog.dart';

class MainList extends StatefulWidget {
  const MainList({
    super.key,
  });

  @override
  State<MainList> createState() => _MainListState();
}

class _MainListState extends State<MainList> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    final dataProvider = Provider.of<QouteListProvider>(context, listen: false);
    scrollController.addListener(() {
      if (scrollController.offset ==
          scrollController.position.maxScrollExtent) {
        if (dataProvider.currentPage < dataProvider.lastPage) {
          dataProvider.isLoading = true;
          dataProvider.currentPage++;
          dataProvider.addMoreData();
        }
      }
    });
    dataProvider.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<QouteListProvider>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF6777EE),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return TambahQoute();
              });
        },
        child: const Icon(
          Icons.add,
          size: 40,
          color: Colors.white,
        ),
      ),
      body: <Widget>[
        Column(
          children: [
            const WidgetBannerList(),
            Expanded(
              flex: 2,
              child: ListView.builder(
                  controller: scrollController,
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(10),
                  itemCount: dataProvider.quotes.length,
                  itemBuilder: (context, index) {
                    final quote = dataProvider.quotes[index];
                    return Container(
                        width: double.infinity,
                        height: 54,
                        margin: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: const Color(0xFF6777EE),
                              width: 1,
                            )
                            // color: Colors.white,
                            ),
                        child: TextButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(15)))),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 7,
                                child: Text(
                                  quote.author ?? '',
                                  style: const TextStyle(
                                    color: Color(0xFF6777EE),
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              Expanded(
                                  child: IconButton(
                                      color: Colors.black,
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return EditQoute(quote: quote);
                                            });
                                      },
                                      icon: const Icon(Icons.create_rounded))),
                              Expanded(
                                  child: IconButton(
                                      color: Colors.red,
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return DeleteQuote(quote: quote);
                                            });
                                      },
                                      icon: const Icon(Icons.delete)))
                            ],
                          ),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return DialogList(
                                    quote: quote,
                                  );
                                });
                          },
                        ));
                  }),
            ),
          ],
        )
        // })
      ][currentPageIndex],
    );
  }

  int currentPageIndex = 0;
}
