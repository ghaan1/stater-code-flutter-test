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
  // List<String> user = [];
  // List<Quote> quotes = [];
  // int selectedIndex = 0;
  int currentPage = 1;
  int totalPage = 0;
  List<Quote> quotes = [];
  RefreshController refreshController = RefreshController(initialRefresh: true);

  // int lastPage = 0;
  // bool isLoading = true;
  // String? quote;
  // String author = '';
  // int id = 0;

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

  // final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  // fetchData() {
  //   ServicesQuote().getMyData(currentPage.toString()).then((resultList) {
  //     setState(() {
  //       quotes = resultList[0];
  //       lastPage = resultList[1];
  //       isLoading = false;
  //     });
  //   });
  // }

  // addMoreData() {
  //   ServicesQuote().getMyData(currentPage.toString()).then((resultList) {
  //     setState(() {
  //       quotes.addAll(resultList[0]);
  //       lastPage = resultList[1];
  //       isLoading = false;
  //     });
  //   });
  // }
  getQuoteData({bool isRefresh = false}) async {
    if (isRefresh) {
      currentPage = 1;
    } else {
      if (currentPage >= totalPage) {
        refreshController.loadNoData();
        return false;
      }
    }
    final dataProvider = Provider.of<QouteListProvider>(context, listen: false);
    dataProvider.getMyData(currentPage);

    if (isRefresh) {
      quotes = dataProvider.responseData.data!;
    } else {
      quotes.addAll(dataProvider.responseData.data!);
    }
    currentPage++;

    totalPage = dataProvider.responseData.totalPages!;
    setState(() {});
    return true;
  }

  @override
  void initState() {
    super.initState();
    getQuoteData();
    // scrollController.addListener(() {
    //   if (scrollController.offset ==
    //       scrollController.position.maxScrollExtent) {
    //     if (currentPage < lastPage) {
    //       setState(() {
    //         isLoading = true;
    //         currentPage++;
    //         // addMoreData();
    //       });
    //     }
    //   }
  }

  //   // fetchData();
  // }

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
                print(dataProvider.responseData.toJson());
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
        // dataProvider.isLoading?
        // Consumer<QouteListProvider>(builder: (context, value, child) {
        //   if (value.isLoading) {
        //     return const Center(
        //       child: CircularProgressIndicator(),
        //     );
        //   }
        // final quote1 = value.quote;
        Column(
          children: [
            const WidgetBannerList(),
            Expanded(
              flex: 2,
              child: SmartRefresher(
                controller: refreshController,
                enablePullUp: true,
                onRefresh: () async {
                  final result = await getQuoteData(isRefresh: true);
                  if (result) {
                    refreshController.refreshCompleted();
                  } else {
                    refreshController.refreshFailed();
                  }
                },
                onLoading: () async {
                  final result = await getQuoteData();
                  if (result) {
                    refreshController.loadComplete();
                  } else {
                    refreshController.loadFailed();
                  }
                },
                child: ListView.builder(
                    // physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(10),
                    // itemCount: quotes.length,
                    // shrinkWrap: true,
                    itemCount: dataProvider.responseData.data?.length,
                    itemBuilder: (ctx, i) {
                      final quote2 = quotes[i];
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
                                    quote2.author ?? '',
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
            ),
          ],
        )
        // })
      ][currentPageIndex],
    );
  }

  int currentPageIndex = 0;
}
