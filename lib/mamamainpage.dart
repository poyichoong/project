import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:project/customerlist.dart';
import 'package:project/main.dart';
import 'package:project/menu.dart';
import 'package:project/cookeracc.dart';




class Mamamainpage extends StatefulWidget {
  Mamamainpage({Key key}) : super(key: key);

  @override
  _MamamainpageState createState() => _MamamainpageState();
}

class _MamamainpageState extends State<Mamamainpage> {
  ScrollController _scrollController = ScrollController();
  CarouselSlider carouselSlider;
  int _current = 0;
  List imgList = [
    'assets/images/1.jpeg',
    'assets/images/2.jpg',
    'assets/images/3.jpg',
    'assets/images/mamacooklg.png',
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
           preferredSize: Size.fromHeight(50),
                  child: AppBar( 
            centerTitle: true,
            title: Text(
              "Mama Cook",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: <Widget>[
               popupMenuButton(),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                   carouselSlider = CarouselSlider(
                height: 200.0,
                initialPage: 0,
                enlargeCenterPage: true,
                autoPlay: true,
                reverse: false,
                enableInfiniteScroll: true,
                autoPlayInterval: Duration(seconds: 5),
                autoPlayAnimationDuration: Duration(seconds: 5),
                // pauseAutoPlayOnTouch: Duration(seconds: 10),
                scrollDirection: Axis.horizontal,
                onPageChanged: (index) {
                  setState(() {
                    _current = index;
                  });
                },
                items: imgList.map((imgUrl) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                          color: Colors.green,
                        ),
                        child: Image.asset(
                          imgUrl,
                          fit: BoxFit.fill,
                        ),
                      );
                    },
                  );
                }).toList(),
              ), 
              SizedBox(
              height: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: map<Widget>(imgList, (index, url) {
                return Container(
                  width: 10.0,
                  height: 10.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index ? Colors.redAccent : Colors.green,
                  ),
                );
              }),
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Chong Kitchen",
                    style: TextStyle(fontSize: 20, color: Colors.black),),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("University Utara Malaysia, Sintok, Kedah",
                    style: TextStyle(fontSize: 15, color: Colors.grey),),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Menu",
                    style: TextStyle(fontSize: 30, color: Colors.black),),
                  ],
                ),
              ],
            ),
             Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: 90,
                      height: 60,
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Spicy Chicken",
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Sweet Beef",
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Spicy Beed",
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(
                    //   width: 90,
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 60,
                          width: 104,
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "RM10 per meal",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "RM1 per delivery",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Mon - Friday",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                  ])),
        ));
  }
  Widget popupMenuButton() {
    return PopupMenuButton<String>(
      icon: Icon(
        Icons.more_vert,
        size: 20,
        color: Colors.white,
      ),
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          value: "account",
          child: Text(
            "Account",
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ),
        PopupMenuItem<String>(
          value: "menu",
          child: Text(
            "Menu",
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ),
        PopupMenuItem<String>(
          value: "customer",
          child: Text(
            "Customer",
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ),
        PopupMenuItem<String>(
          value: "logout",
          child: Text(
            "Log Out",
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        )
      ],
      onSelected: (selectedItem) {
        switch (selectedItem) {
          case "logout":
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Login(),
                ));
            break;
            case "account":
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Customeracc(),
                ));
            break;
            case "menu":
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Menu(),
                ));
            break;
            case "customer":
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Customerlist(),
                ));
            break;
        }
      },
    );
  }
 
  void _account() {
    //  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Register(),));
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Customeracc(),
        ));
  }
  
}

class Mamaacc {
}
