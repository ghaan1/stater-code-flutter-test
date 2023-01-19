import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:startercodepacitan/Pages/Home%20Page/Navbar/List/CRUD/Create/create_page.dart';
import 'package:startercodepacitan/Pages/Home%20Page/Navbar/List/Components/dialog.dart';

import 'Components/bannerlist_page.dart';

class MainList extends StatefulWidget {
  const MainList({
    super.key,
  });

  @override
  State<MainList> createState() => _MainListState();
}

class _MainListState extends State<MainList> {
  List listUsers = [];
  String name = '';
  List<String> user = [];
  // List<Category> categories = [];
  int selectedIndex = 0;
  int currentPage = 1;
  int lastPage = 0;
  bool isLoading = true;
  final ScrollController scrollController = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  // fetchData() {
  //   CrudHelper.getCategories(currentPage.toString()).then((resultList) {
  //     setState(() {
  //       categories = resultList[0];
  //       lastPage = resultList[1];
  //       isLoading = false;
  //     });
  //   });
  // }

  // addMoreData() {
  //   CrudHelper.getCategories(currentPage.toString()).then((resultList) {
  //     setState(() {
  //       categories.addAll(resultList[0]);
  //       lastPage = resultList[1];
  //       isLoading = false;
  //     });
  //   });
  // }

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
            // addMoreData();
          });
        }
      }
    });

    // fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF6777EE),
        onPressed: () {
          // showDialog(
          //     context: context,
          //     builder: (context) {
          //       // return const TambahKategori();
          //     });
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const TambahQoute();
              },
            ),
          );
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
                  // itemCount: categories.length,
                  itemBuilder: (context, index) {
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
                              // Expanded(
                              //   flex: 7,
                              //   child: Text(
                              //     categories[index].name,
                              //     style: const TextStyle(
                              //       color: Color(0xFF6777EE),
                              //       fontFamily: 'Nunito',
                              //       fontWeight: FontWeight.bold,
                              //     ),
                              //     textAlign: TextAlign.start,
                              //   ),
                              // ),
                              // Expanded(
                              //     child: IconButton(
                              //         color: Colors.black,
                              //         onPressed: () {
                              //           showDialog(
                              //               context: context,
                              //               builder: (context) {
                              //                 return EditKategori(
                              //                     category: categories[index]);
                              //               });
                              //         },
                              //         icon: Icon(Icons.create_rounded))),
                              // Expanded(
                              //     child: IconButton(
                              //         color: Colors.red,
                              //         onPressed: () {
                              //           showDialog(
                              //               context: context,
                              //               builder: (context) {
                              //                 return DeleteCategori(
                              //                     category: categories[index]);
                              //               });
                              //         },
                              //         icon: Icon(Icons.delete)))
                            ],
                          ),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return DialogList(
                                      // category: categories[index],
                                      );
                                });
                          },
                        ));
                  }),
            ),
          ],
        ),
      ][currentPageIndex],
    );
  }
}

int currentPageIndex = 0;
