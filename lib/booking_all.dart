import 'package:admin_app/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'Model/booking_model.dart';

class booking_all extends StatefulWidget {
  const booking_all({super.key,});


  @override
  State<booking_all> createState() => _booking_allState();
}

class _booking_allState extends State<booking_all> {

  var status ="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("BOOKING"),
        backgroundColor: colorPage.primaryColor,
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("booking").snapshots().map((snapshots){
            return snapshots.docs.map((doc){
              return BookingModel.fromMap(doc.data());
            }).toList();

          }),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }

            List<BookingModel>data=snapshot.data!;
            return   Padding(
              padding:  EdgeInsets.only(left: width*0.03,right: width*0.03),
              child: Expanded(
                child: ListView.separated(
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {

                    return Container(
                      height: width*0.08,
                      width: width*0.08,
                      color: Colors.grey,
                      child: Padding(
                        padding:  EdgeInsets.only(left: width*0.03,right: width*0.03),

                        child: ListTile(
                            leading:  Container(
                                height: width*0.1,
                                width: width*0.1,
                                // color: Colors.red,
                                child: Image.network(data[index].images)),
                            title: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text(data[index].picService,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: width*0.012
                                    )),
                                Text(data[index].serviceVehicle,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: width*0.012
                                    )),
                                Text(data[index].takeDate,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: width*0.012
                                    )),
                              ],

                            ),
                            trailing:Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                InkWell(
                                  onTap: () {
                                    status="Accept";
                                    FirebaseFirestore.instance.collection("booking").doc(data[index].id).update(
                                        {

                                          "status":status.toString()
                                        });
                                  },
                                  child: Container(
                                    width: width * 0.06,
                                    height: width * 0.04,
                                    child: Center(
                                        child: Text(
                                          "Accept",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: width * 0.012,
                                              fontWeight: FontWeight.w600),
                                        )),
                                    decoration: BoxDecoration(
                                        color: colorPage.primaryColor,
                                        borderRadius: BorderRadius.circular(
                                            width * 0.01)),
                                  ),
                                ),
                                SizedBox(width: width*0.015,),
                                InkWell(
                                  onTap: () {

                                    status="reject";
                                    FirebaseFirestore.instance.collection("booking").doc(data[index].id).update(
                                        {
                                          "status":status.toString()
                                        });
                                  },
                                  child: Container(
                                    width: width * 0.06,
                                    height: width * 0.04,
                                    child: Center(
                                        child: Text(
                                          "Reject",
                                          style: TextStyle(
                                              color:Colors.white,

                                              fontSize: width * 0.012,
                                              fontWeight: FontWeight.w600),
                                        )),
                                    decoration: BoxDecoration(
                                        color: colorPage.primaryColor,

                                        borderRadius: BorderRadius.circular(
                                            width * 0.01)),
                                  ),
                                ),
                                SizedBox(width: width*0.015,),
                                // int selectedOption = 0;
                                InkWell(
                                  onTap: () {

                                    status="serviced";
                                    FirebaseFirestore.instance.collection("booking").doc(data[index].id).update(
                                        {
                                          "status":status.toString()
                                        });
                                  },
                                  child: Container(
                                    width: width * 0.06,
                                    height: width * 0.04,
                                    child: Center(
                                        child: Text(
                                          "Serviced",
                                          style: TextStyle(
                                              color:Colors.white,

                                              fontSize: width * 0.012,
                                              fontWeight: FontWeight.w600),
                                        )),
                                    decoration: BoxDecoration(
                                        color: colorPage.primaryColor,
                                        borderRadius: BorderRadius.circular(
                                            width * 0.01)),
                                  ),
                                ),
                              ],
                            )
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: width*0.015,);
                  },
                ),
              ),
            );
          }
      ),
    );
  }
}
