import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutterfooddeliveryappui/core/consts.dart';
import 'package:flutterfooddeliveryappui/core/flutter_icons.dart';
import 'package:flutterfooddeliveryappui/models/food_model.dart';
import 'package:flutterfooddeliveryappui/widgets/app_clipper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'dart:math' as math;

import 'detail_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<FoodModel> foodList = FoodModel.list;
  PageController _pageController = PageController(viewportFraction: .8);
  var paddingLeft = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 45),
              child: _buildRightSection(),
            ),
            Container(
              color: AppColors.greenColor,
              height: MediaQuery.of(context).size.height,
              width: 50,
              padding: EdgeInsets.only(top: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 40,
                    height: 40,
                    margin: EdgeInsets.only(top: 16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                        image: DecorationImage(
                          image: ExactAssetImage("assets/profile.jpg"),
                        )),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    margin: EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                        color: Colors.white),
                    child: Center(
                      child: Icon(FlutterIcons.menu),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Transform.rotate(
                angle: -math.pi / 2,
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        _buildMenu("Vegetables", 0),
                        _buildMenu("Chicken", 1),
                        _buildMenu("Beef", 2),
                      ],
                    ),
                    AnimatedContainer(
                      duration: Duration(
                        milliseconds: 250,
                      ),
                      margin: EdgeInsets.only(left: paddingLeft),
                      width: 150,
                      height: 50,
                      child: Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: ClipPath(
                              clipper: AppClipper(),
                              child: Container(
                                width: 150,
                                height: 70,
                                color: AppColors.greenColor,
                              ),
                            ),
                          ),
                          Align(
                            child: Transform.rotate(
                              child: Padding(
                                padding: EdgeInsets.only(right: 30),
                                child: Icon(
                                  FlutterIcons.arrow,
                                  size: 15,
                                ),
                              ),
                              angle: math.pi / 2,
                            ),
                            alignment: Alignment.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cusomAppBar() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        children: <Widget>[
          RichText(
            text: TextSpan(
                text: "Hello,\n",
                style: TextStyle(
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: "Ahmed Ebead",
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      height: 1.5,
                    ),
                  )
                ]),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: AppColors.greenLightColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search ..",
                      ),
                    ),
                  ),
                  Icon(
                    FlutterIcons.search,
                    size: 16,
                  )
                ],
              ),
            ),
          ),
          SizedBox(width: 16),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            child: Center(
              child: Icon(
                FlutterIcons.shop,
                size: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPopularList() {
    return ListView.builder(
      padding: EdgeInsets.only(left: 40, bottom: 16, top: 20),
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemCount: foodList.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(bottom: 16),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(.1),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
          ),
          child: GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (_)=>DetailPage(foodList[index])));
            },
            child: Row(
              children: <Widget>[
                Image(
                  image: AssetImage("assets/${foodList[index].imgPath}"),
                  width: 100,
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "${foodList[index].name}",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: <Widget>[
                        Text(
                          "\$ ${foodList[index].price.toInt()}",
                          style: TextStyle(
                              color: AppColors.redColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 16),
                        Text(
                          "(${foodList[index].weight.toInt()} gm Weight)",
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildBackGroung(int index) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.greenColor,
        borderRadius: BorderRadius.all(
          Radius.circular(32),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: SizedBox(),
          ),
          Row(
            children: <Widget>[
              RatingBar(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 14,
                unratedColor: Colors.black12,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.black,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "(+120)",
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
          Text(
            "${foodList[index].name}",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ],
      ),
      margin: EdgeInsets.only(
        top: 50,
        bottom: 20,
        right: 50,
      ),
      padding: EdgeInsets.all(20),
    );
  }

  Widget _buildRightSection() {
    return Padding(
      padding: EdgeInsets.only(top: 25),
      child: Column(
        children: <Widget>[
          _cusomAppBar(),
          Expanded(
            child: ListView(
              children: <Widget>[
                Container(
                  height: 350,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: foodList.length,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (_)=>DetailPage(foodList[index])));
                        },
                        child: Padding(
                          padding: EdgeInsets.only(right: 40),
                          child: Stack(
                            children: <Widget>[
                              _buildBackGroung(index),
                              Align(
                                child: Transform.rotate(
                                  child: Hero(
                                    tag: "image${foodList[index].imgPath}",
                                    child: Image(
                                      image: AssetImage(
                                          "assets/${foodList[index].imgPath}"),
                                      width: 175,
                                    ),
                                  ),
                                  angle: math.pi / 3.5,
                                ),
                                alignment: Alignment.topRight,
                              ),
                              Positioned(
                                bottom: 0,
                                right: 30,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.redColor,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20))),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 8,
                                      horizontal: 16,
                                    ),
                                    child: Text(
                                      "\$${foodList[index].price.toInt()}",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 40),
                  child: Text(
                    "Popular",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                  ),
                ),
                _buildPopularList(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildMenu(String name, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          paddingLeft = index * 150.0;
        });
      },
      child: Container(
        width: 150,
        padding: EdgeInsets.only(top: 16),
        child: Center(
          child: Text(
            name,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
