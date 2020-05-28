import 'package:flutterfooddeliveryappui/core/consts.dart';
import 'package:flutterfooddeliveryappui/core/flutter_icons.dart';
import 'package:flutterfooddeliveryappui/models/food_model.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final FoodModel data;

  const DetailPage(this.data);
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greenColor,
      body: Column(
        children: <Widget>[
          SizedBox(height: 25),
          _customAppBar(),
          Container(
            height: MediaQuery.of(context).size.height * .25,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: <Widget>[
                Image(
                  image: AssetImage("assets/bg.png"),
                  fit: BoxFit.fill,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Hero(
                     tag: "image${widget.data.imgPath}",
                    child: Image(
                      image: AssetImage(
                        "assets/${widget.data.imgPath}",

                      ),
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              padding: EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "${widget.data.name}",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: <Widget>[
                      Text(
                        "\$${widget.data.price.toInt()}",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: AppColors.redColor,
                        ),
                      ),
                      SizedBox(width: 30),
                      _buildCounter(),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _foodInfo("Weight", "${widget.data.weight.toInt()} gm"),
                      _foodInfo(
                          "Calories", "${widget.data.calory.toInt()} cal"),
                      _foodInfo("Protein", "${widget.data.protein.toInt()} gm"),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Items",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text("${widget.data.item}"),
                  Expanded(child: SizedBox()),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          onPressed: () {},
                          padding: EdgeInsets.symmetric(
                            vertical: 16,
                          ),
                          color: AppColors.greenColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: Text(
                            "Add to cart",
                            style: TextStyle(
                              fontSize: 28,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _foodInfo(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          value,
          style: TextStyle(fontSize: 16, color: AppColors.redColor),
        ),
      ],
    );
  }

  Widget _customAppBar() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              child: Icon(
                FlutterIcons.left,
                size: 16,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            child: Icon(
              FlutterIcons.shop,
              size: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCounter() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.greenColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: Row(
        children: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.remove,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "1",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.add,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
