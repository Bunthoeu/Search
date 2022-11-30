import 'package:build_search_catpro/model/list_item.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SearchScreen(),
    );
  }
}

class SearchScreen extends StatefulWidget {
  SearchScreen({
    super.key,
  });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController textEditingController = TextEditingController();
  var itemListSearch = ItemListSearch.ganerateList();
  List<String> onSearch = [];
  List<String> searchTerms = [
    "Apple",
    "Banana",
    "Mango",
    "Pear",
    "Watermelons",
    "Blueberries",
    "Pineapples",
    "Strawberries"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
              top: 40,
            ),
            height: 105,
            width: double.infinity,
            color: Color(0xff19034F),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 8),
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(Icons.arrow_back),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    height: 32,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          onSearch = searchTerms
                              .where((element) => element.contains(value))
                              .toList();
                        });
                      },
                      controller: textEditingController,
                      maxLines: 1,
                      style: TextStyle(fontSize: 17),
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        filled: true,
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.cancel,
                          ),
                          color: Color(0xff19034F),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        fillColor:
                            Theme.of(context).inputDecorationTheme.fillColor,
                        contentPadding: EdgeInsets.only(left: 16),
                        hintText: 'Search For Promotion',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                margin: EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Recently Search',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Container(
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.start,
                        verticalDirection: VerticalDirection.down,
                        // runSpacing: 3.0,
                        // spacing: 3.0,
                        children: <Widget>[
                          ChipDesign("Lifetime"),
                          ChipDesign("Student"),
                          ChipDesign("Salaried"),
                          ChipDesign("Corporate"),
                          ChipDesign("Open"),
                          ChipDesign("My Referral Code Users"),
                          ChipDesign("+10"),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Your Search',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Column(
                      children: [
                        ListView.builder(
                          itemCount:textEditingController.text.isEmpty?onSearch.length: searchTerms.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              child: Container(
                                height: 88,
                                margin: EdgeInsets.only(top: 16),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 16, vertical: 16),
                                            width: 60,
                                            height: 60,
                                            decoration: BoxDecoration(
                                              color: Colors.amber,
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                searchTerms[index],
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 4,
                                              ),
                                              Text(
                                                '3.4Km',
                                                style: TextStyle(
                                                  color: Colors.pink,
                                                  fontSize: 8,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 4,
                                              ),
                                              Text(
                                                'Expire:10/02/2022',
                                                style: TextStyle(
                                                  color: Colors.amber[700],
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                        vertical: 16,
                                      ),
                                      height: 100,
                                      width: 1,
                                      color: Colors.grey,
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 16),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            searchTerms[index],
                                            style: TextStyle(
                                              color: Colors.pink[400],
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                          Text(
                                            searchTerms[index].toUpperCase(),
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChipDesign extends StatelessWidget {
  final String _label;

  ChipDesign(this._label);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Chip(
        label: Text(
          _label,
          style: TextStyle(color: Colors.white),
        ),
        padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
      ),
      margin: EdgeInsets.only(
        left: 10,
      ),
    );
  }
}
