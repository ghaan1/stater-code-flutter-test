import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:startercodepacitan/Pages/Home%20Page/Navbar/List/CRUD/create_page.dart';
import 'package:startercodepacitan/Pages/Home%20Page/Navbar/List/CRUD/delete_page.dart';
import 'package:startercodepacitan/Pages/Home%20Page/Navbar/List/CRUD/edit_page.dart';
import 'package:startercodepacitan/Pages/Home%20Page/Navbar/List/Components/dialog.dart';
import 'package:startercodepacitan/models/models_quote.dart';
import 'package:startercodepacitan/provider/provider_qoutes.dart';
import 'package:startercodepacitan/services/services.dart';

import 'Components/bannerlist_page.dart';

class MainList extends StatefulWidget {
  const MainList({
    super.key,
  });

  @override
  State<MainList> createState() => _MainListState();
}

class _MainListState extends State<MainList> {
  List<String> user = [];
  List<Quote> quotes = [];
  int selectedIndex = 0;
  int currentPage = 1;
  int lastPage = 0;
  bool isLoading = true;
  // String quote = '';
  // String author = '';
  int id = 0;

  // getPref() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   setState(() {
  //     const key = 'quote';
  //     const key1 = 'author';
  //     const key2 = 'id';
  //     final value = pref.get(key);
  //     final value1 = pref.get(key1);
  //     final value2 = pref.get(key2);
  //     quote = '$value';
  //     author = '$value1';
  //     id = '$value2' as int;
  //   });
  // }

  final ScrollController scrollController = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  fetchData() {
    ServicesQuote().getQuotes(currentPage.toString()).then((resultList) {
      setState(() {
        quotes = resultList[0];
        lastPage = resultList[1];
        isLoading = false;
      });
    });
  }

  addMoreData() {
    ServicesQuote().getQuotes(currentPage.toString()).then((resultList) {
      setState(() {
        quotes.addAll(resultList[0]);
        lastPage = resultList[1];
        isLoading = false;
      });
    });
  }

  provider() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.offset ==
          scrollController.position.maxScrollExtent) {
        if (currentPage < lastPage) {
          setState(() {
            isLoading = true;
            currentPage++;
            addMoreData();
          });
        }
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<QouteListProvider>(context, listen: false)
          .getAllQuote(currentPage.toString());
    });
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    // final qouteProvider = Provider.of<QouteListProvider>(context);
    // List quote = quotes;

    // _quote.getAllQoutes(quotes);
    // author = Provider.of<QouteListProvider>(context).quote.;
    // Provider.of<QouteListProvider>(context).getAllQoutes(quote);
    // context.read<ServicesQuote>.getQuotes(quote);
    // Quote _quotes =
    //     Provider.of<QouteListProvider>(context).getAllQoutes(fetchData());

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF6777EE),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                // print(quoteProvider.quote.author);

                return const TambahQoute();
              });

          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) {
          //       return const TambahQoute();
          //     },
          //   ),
          // );
        },
        child: const Icon(
          Icons.add,
          size: 40,
          color: Colors.white,
        ),
      ),
      body: <Widget>[
        Consumer<QouteListProvider>(builder: (context, value, child) {
          if (value.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final quote1 = value.quote;
          return Column(
            children: [
              const WidgetBannerList(),
              Expanded(
                flex: 2,
                child: ListView.builder(
                    controller: scrollController,
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(10),
                    itemCount: quote1.length,
                    itemBuilder: (context, index) {
                      final quote2 = quote1[index];
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
                                    // _qoute[index].quote ?? '',
                                    // _quotes[index].author ?? '',
                                    quote2.toString(),
                                    // _quoteProvider.quote,
                                    // 'q',
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
                                                print(quote2);
                                                return EditQoute(
                                                    quote: quotes[index]);
                                              });
                                        },
                                        icon: Icon(Icons.create_rounded))),
                                Expanded(
                                    child: IconButton(
                                        color: Colors.red,
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return DeleteQuote(
                                                    quote: quotes[index]);
                                              });
                                        },
                                        icon: Icon(Icons.delete)))
                              ],
                            ),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return DialogList(
                                      quote: quotes[index],
                                    );
                                  });
                            },
                          ));
                    }),
              ),
            ],
          );
        })
      ][currentPageIndex],
    );
  }
}

int currentPageIndex = 0;
