import 'package:admin_app/Model/user_model.dart';
import 'package:admin_app/booking_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class user_list extends StatefulWidget {
  const user_list({super.key});

  @override
  State<user_list> createState() => _user_listState();
}

class _user_listState extends State<user_list> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("USER LIST"),
        backgroundColor: colorPage.primaryColor,
      ),
      body: Column(
        children: [
          SizedBox(
            height: width * 0.012,
          ),
          Expanded(
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('carwash')
                    .snapshots().map((snapshots){
                      return snapshots.docs.map((doc){
                        return userModel.fromMap(doc.data());
                      }).toList();
                }),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }

                  List<userModel> data=snapshot.data!;


                  return ListView.separated(
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        // width:width*0.01,
                        height: width * 0.1,
                        decoration: BoxDecoration(
                            color: colorPage.primaryColor,
                            borderRadius: BorderRadius.circular(width * 0.03)),

                        // margin:EdgeInsets.all(width*0.01),

                        margin: EdgeInsets.only(
                            left: width * 0.02, right: width * 0.02),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: width*0.07,
                              width: width*0.07,
                              decoration: BoxDecoration(
                                image: DecorationImage(image: NetworkImage(data[index].images!)),
                                  // color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                      width * 0.01)),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(data[index].name!,
                                    style: TextStyle(
                                        fontSize: width * 0.012,
                                        color: Colors.white)),
                                SizedBox(
                                  height: width * 0.01,
                                ),
                                Text(data[index].email!,
                                    style: TextStyle(
                                        fontSize: width * 0.012,
                                        color: Colors.white)),
                                SizedBox(
                                  height: width * 0.01,
                                ),
                                Text(data[index].phoneNumber!,
                                    style: TextStyle(
                                      fontSize: width * 0.012,
                                      color: Colors.white,
                                    )),
                                SizedBox(
                                  height: width * 0.01,
                                ),
                                Text(data[index].id!,
                                    style: TextStyle(
                                      fontSize: width * 0.012,
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                        InkWell(

                          onTap: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => booking_page(
                                    id: data[index].id!,
                                  ),
                                ));
                          },
                          child: Container(
                            width: width * 0.06,
                            height: width * 0.04,
                            child: Center(
                                child: Text(
                                  "Bookings",
                                  style: TextStyle(
                                      fontSize: width * 0.012,
                                      fontWeight: FontWeight.w600),
                                )),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                    width * 0.01)),
                          ),
                        ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: width * 0.01,
                      );
                    },
                  );
                }),
          )
        ],
      ),
    );
  }
}
