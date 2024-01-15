import 'package:admin_app/add_vehicle.dart';
import 'package:admin_app/banner_page.dart';
import 'package:admin_app/user_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class first_page extends StatefulWidget {
  const first_page({super.key});

  @override
  State<first_page> createState() => _first_pageState();
}

class _first_pageState extends State<first_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => user_list(),
                        ));
                  },
                  child: Container(
                    height: width * 0.15,
                    width: width * 0.15,
                    child: Center(
                        child: Text(
                      "USERS",
                      style: TextStyle(
                          color: Colors.white, fontSize: width * 0.02),
                    )),
                    decoration: BoxDecoration(
                        color: colorPage.primaryColor,
                        borderRadius: BorderRadius.circular(width * 0.02)),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => banner_page(),
                      ));
                },
                child: Container(
                  height: width * 0.15,
                  width: width * 0.15,
                  child: Center(
                      child: Text(
                    "BANNER",
                    style:
                        TextStyle(color: Colors.white, fontSize: width * 0.02),
                  )),
                  decoration: BoxDecoration(
                      color: colorPage.primaryColor,
                      borderRadius: BorderRadius.circular(width * 0.02)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, CupertinoPageRoute(builder: (context) =>add_vehicle(),));
                },
                child: Container(
                  height: width * 0.15,
                  width: width * 0.15,
                  child: Center(
                      child: Text(
                        "ADD VEHICLE",
                        style: TextStyle(
                            color: Colors.white, fontSize: width * 0.02),
                      )),
                  decoration: BoxDecoration(
                      color: colorPage.primaryColor,
                      borderRadius: BorderRadius.circular(width * 0.02)),
                ),
              ),
              GestureDetector(
                onTap: () {

                },
                child: Container(
                  height: width * 0.15,
                  width: width * 0.15,
                  child: Center(
                      child: Text(
                        "BOOKING",
                        style: TextStyle(
                            color: Colors.white, fontSize: width * 0.02),
                      )),
                  decoration: BoxDecoration(
                      color: colorPage.primaryColor,
                      borderRadius: BorderRadius.circular(width * 0.02)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
