import 'package:admin_app/Model/booking_model.dart';
import 'package:admin_app/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class booking_page extends StatefulWidget {
  const booking_page({super.key, required this.id});
  final String id;

  @override
  State<booking_page> createState() => _booking_pageState();
}

class _booking_pageState extends State<booking_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("BOOKING"),
        backgroundColor: colorPage.primaryColor,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("booking").
        where("id",isEqualTo: widget.id).snapshots().map((snapshots){
          return snapshots.docs.map((doc){
            return BookingModel.fromMap(doc.data());
          }).toList();
          
        }),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          List<BookingModel>data=snapshot.data!;
          // var data = snapshot.data!.docs;
          return Padding(
            padding:  EdgeInsets.only(left: width*0.03),
            // child: Container(
            //   height: width*0.25,
            //   width: width*0.4,
            //   color: Colors.red,
              child: Expanded(
                child: ListView.separated(
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {

                    return Container(
                      height: width*0.3,
                      width: width*0.4,
                      // color: Colors.red,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                height: width*0.1,
                                width: width*0.15,
                                child: Image.network(data[index].images)),
                            Text("service_vehicle           :${data[index].serviceVehicle}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: width*0.015
                                )),
                            Text("pic_a_service              :${data[index].picService}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: width*0.015
                                )),
                            Text("pic_your_comfort       :${data[index].picYourComfort}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: width*0.015
                                )),
                            Text("take_a_date                 :${data[index].takeDate}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: width*0.015
                                )),
                            Text("pic_slot                        :${data[index].picSlot}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: width*0.015
                                )),
                            Text("add_your_note            :${data[index].addYourNote}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: width*0.015
                                )),
                            Text("add_your_location      :${data[index].addYourLocation}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: width*0.015
                                )),
                            Text("payment_method       :${data[index].paymentMethod}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: width*0.015
                                )),

                            Text("-----------------------------------------------------------------")

                          ],

                        ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: width*0.01,);
                  },
                ),
              ),
            // ),
          );
        }
      ),
    );
  }
}
