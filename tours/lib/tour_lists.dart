// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';

class TourList extends StatelessWidget {
  TourList(
      {super.key,
      required this.fromPlace,
      required this.toPlace,
      required this.smallInfo});

  String fromPlace;
  String toPlace;
  String smallInfo;

  List<Category> categories = Utils.getMockedCategories();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$fromPlace - $toPlace"),
      ),
      //drawer: Drawer(),
      body: Container(
        child: Column(
          children: [
            Text(''),
            Expanded(
              child: ListView.builder(
                itemCount: categories.length,
                itemBuilder: (BuildContext ctx, int index) {
                  return Container(
                    margin: EdgeInsets.all(20),
                    //height: 150,
                    child: Column(
                      children: [
                        Positioned.fill(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              'assets/images/' +
                                  categories[index].imgName +
                                  '.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            //height: 220,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Colors.black.withOpacity(0.7),
                                  Colors.transparent,
                                ],
                              ),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  '${categories[index].tourName}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.black),
                                ),
                                Spacer(),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Text('${categories[index].nights}'),
                                    Text('${categories[index].isFood}'),
                                  ],
                                ),
                                Spacer(),
                                Text(
                                  '${categories[index].price}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Category {
  String tourName;
  String imgName;
  String nights;
  String isFood;
  String price;

  Category({
    required this.tourName,
    required this.imgName,
    required this.nights,
    required this.isFood,
    required this.price,
  });
}

class Utils {
  static List<Category> getMockedCategories() {
    return [
      Category(
          tourName: 'Bayanaul.tour',
          imgName: 'bayan',
          nights: '4 ночей',
          isFood: 'еда включена',
          price: '156 480 T'),
      Category(
          tourName: 'Sapar.tour',
          imgName: 'sapar',
          nights: '4 ночей',
          isFood: 'еда включена',
          price: '140 780 T'),
    ];
  }
}
