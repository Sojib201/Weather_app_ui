import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'custom_clip.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            decoration: BoxDecoration(),
            width: size.width,
            height: size.height,
            child: const Image(
              image: AssetImage(
                "images/back.png",
              ),
              fit: BoxFit.fill,
            ),
          ),
          const Positioned(
            top: 30,
            left: 90,
            right: 90,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  "Bengaluru",
                  style:
                      TextStyle(color: Colors.white, fontSize: 32, height: 1),
                ),
                Text(
                  "19°",
                  style:
                      TextStyle(color: Colors.white, fontSize: 80, height: 1,fontWeight: FontWeight.w100),
                ),
                Text(
                  "Mostly clear",
                  style: TextStyle(color: Colors.grey, fontSize: 20, height: 1),
                ),
                Text(
                  "H : 24 L: 18°",
                  style:
                      TextStyle(color: Colors.white, fontSize: 20, height: 1.5),
                ),
              ],
            ),
          ),
          const Positioned(
            top: 245,
            child: Image(
              image: AssetImage("images/house.png"),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(

                decoration: BoxDecoration(
                  color: Colors.deepPurple.withOpacity(0.2),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                  ),
                  border: Border(top: BorderSide(color: Colors.grey))
                ),
                height: size.height / 2.4,
                width: size.width,
                child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                      child: const Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: 25, left: 16, right: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Hourly Forecast",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  "Weekly Forecast",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          Divider(),
                          SizedBox(
                            height: 10,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                WeatherItem(
                                  imagePath: "images/icon1.png",
                                  temperature: "19°",
                                  time: "12 PM",
                                ),
                                WeatherItem(
                                  imagePath: "images/icon2.png",
                                  temperature: "20°",
                                  time: "2 PM",
                                ),
                                WeatherItem(
                                  imagePath: "images/icon3.png",
                                  temperature: "22°",
                                  time: "3 PM",
                                ),
                                WeatherItem(
                                  imagePath: "images/icon1.png",
                                  temperature: "21°",
                                  time: "1 PM",
                                ),
                                WeatherItem(
                                  imagePath: "images/icon3.png",
                                  temperature: "20°",
                                  time: "4 PM",
                                ),
                                WeatherItem(
                                  imagePath: "images/icon2.png",
                                  temperature: "19°",
                                  time: "3 PM",
                                ),
                                WeatherItem(
                                  imagePath: "images/icon1.png",
                                  temperature: "22°",
                                  time: "2 PM",
                                ),
                                WeatherItem(
                                  imagePath: "images/icon3.png",
                                  temperature: "21°",
                                  time: "12 PM",
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ))),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 80,
              width: size.width,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                          border:
                              Border(bottom: BorderSide(color: Colors.grey)),
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(
                                35,
                              ),
                              bottomLeft: Radius.circular(35))),
                      height: 80,
                      child: const Center(
                        child: Icon(
                          Icons.fmd_good_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                          border: Border(top: BorderSide(color: Colors.grey)),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(55),
                              topRight: Radius.circular(55))),
                      height: 80,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.grey)),
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(
                              35,
                            ),
                            bottomLeft: Radius.circular(35)),
                      ),
                      height: 80,
                      child: const Center(
                        child: Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          onPressed: () {},
          child: Icon(
            Icons.add,
            size: 40,
          ),
          backgroundColor: Colors.white,
          foregroundColor: Colors.blue,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class WeatherItem extends StatelessWidget {
  final String temperature;
  final String imagePath;
  final String time;

  const WeatherItem({
    super.key,
    required this.temperature,
    required this.imagePath,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6),
      height: MediaQuery.of(context).size.height / 5,
      width: MediaQuery.of(context).size.width / 5.5,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            textAlign: TextAlign.center,
            time,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          Image(
            image: AssetImage(imagePath),
          ),
          Text(
            textAlign: TextAlign.center,
            temperature,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
