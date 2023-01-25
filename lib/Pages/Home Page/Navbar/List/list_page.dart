import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
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
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // getQuoteData();
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
                // print(dataProvider.responseData.toJson());
                print(dataProvider.quotes);
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
        Column(
          children: [
            const WidgetBannerList(),
            Expanded(
              flex: 2,
              child: ListView.builder(
                  controller: scrollController,
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(10),
                  // itemCount: quotes.length,
                  // shrinkWrap: true,
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
                                  // _qoute[index].quote ?? '',
                                  // dataProvider.quotes[index].author ?? '',
                                  quote.author ?? '',
                                  // dataProvider.responseData.data?[i].quote ??
                                  //     '',
                                  // quote2.toString(),
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
                                        // showDialog(
                                        //     context: context,
                                        //     builder: (context) {
                                        //       print(quote2);
                                        //       return EditQoute(
                                        //           quote: quotes[i]
                                        //           );

                                        //     });
                                      },
                                      icon: Icon(Icons.create_rounded))),
                              Expanded(
                                  child: IconButton(
                                      color: Colors.red,
                                      onPressed: () {
                                        // showDialog(
                                        //     context: context,
                                        //     builder: (context) {
                                        //       return DeleteQuote(
                                        //           quote: quotes[i]);
                                        //     });
                                      },
                                      icon: Icon(Icons.delete)))
                            ],
                          ),
                          onPressed: () {
                            // showDialog(
                            //     context: context,
                            //     builder: (context) {
                            //       return DialogList(
                            //         quote: quotes[i],
                            //       );
                            //     });
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
