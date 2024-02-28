import 'package:admin_app/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class add_vehicle extends StatefulWidget {
  const add_vehicle({super.key});

  @override
  State<add_vehicle> createState() => _add_vehicleState();
}

class _add_vehicleState extends State<add_vehicle> {
  TextEditingController vehicle_name_controller = TextEditingController();
  TextEditingController model_name_controller1 = TextEditingController();
  String? dropdown_value;
  String? dropdown1_value;
  List<String> selectItem = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("ADD VEHICLE"),
        backgroundColor: colorPage.primaryColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: width * 0.03,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: width * 0.01,
              ),
              Container(
                height: width * 0.08,
                width: width * 0.4,
                child: TextFormField(
                  controller: vehicle_name_controller,
                  textCapitalization: TextCapitalization.words,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.done,
                  style: TextStyle(
                      fontSize: width * 0.013,
                      fontWeight: FontWeight.w400,
                      color: colorPage.primaryColor),
                  decoration: InputDecoration(
                      labelText: "Enter Vehicle Name",
                      labelStyle: TextStyle(
                          fontSize: width * 0.012,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade800),
                      // hintText: "pleace enter your name",
                      // hintStyle: TextStyle(
                      //   fontSize: width * 0.05,
                      //   fontWeight: FontWeight.w600,
                      // ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(width * 0.008),
                          borderSide: BorderSide(
                            color: colorPage.primaryColor,
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(width * 0.008),
                          borderSide: BorderSide(
                            color: colorPage.primaryColor,
                          ))),
                ),
              ),
              SizedBox(
                width: width * 0.01,
              ),
              GestureDetector(
                onTap: () {
                  FirebaseFirestore.instance
                      .collection("Vehicle")
                      .doc("Vehicles")
                      .update({vehicle_name_controller.text: []});
                  vehicle_name_controller.clear();
                },
                child: Container(
                  height: width * 0.03,
                  width: width * 0.07,
                  child: Center(
                    child: Text("Add Vehicle",
                        style: TextStyle(color: Colors.white)),
                  ),
                  decoration: BoxDecoration(
                      color: colorPage.primaryColor,
                      borderRadius: BorderRadius.circular(width * 0.01)),
                ),
              )
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: width * 0.01,
              ),
              Container(
                height: width * 0.03,
                width: width * 0.2,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: colorPage.primaryColor,
                  ),
                  borderRadius: BorderRadius.circular(width * 0.008),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.only(right: width * 0.01, left: width * 0.01),
                  child: StreamBuilder<DocumentSnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection("Vehicle")
                          .doc("Vehicles")
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(child: CircularProgressIndicator());
                        }
                        var data = snapshot.data;
                        Map<String, dynamic> DataMap =
                            data?.data() as Map<String, dynamic>;
                        List banners = DataMap.keys.toList();
                        return DropdownButton(
                          // padding: EdgeInsets.all(width * 0.01),
                          hint: Text("vehicle Name",
                              style: TextStyle(fontSize: width * 0.015)),
                          dropdownColor: Colors.white,
                          borderRadius: BorderRadius.circular(width * 0.008),
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: colorPage.primaryColor,
                          ),
                          iconSize: width * 0.02,
                          isExpanded: true,
                          underline: SizedBox(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: width * 0.015,
                          ),
                          value: dropdown_value,
                          onChanged: (newValue) {
                            setState(() {
                              dropdown_value = newValue.toString();
                            });
                          },
                          items: banners.map((valueItem) {
                            return DropdownMenuItem(
                              value: valueItem,
                              child: Text(valueItem),
                            );
                          }).toList(),
                        );
                      }),
                ),
              ),
              SizedBox(
                width: width * 0.01,
              ),
              Container(
                height: width * 0.03,
                width: width * 0.2,
                child: TextFormField(
                  controller: model_name_controller1,
                  textCapitalization: TextCapitalization.words,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.done,
                  style: TextStyle(
                      fontSize: width * 0.013,
                      fontWeight: FontWeight.w400,
                      color: colorPage.primaryColor),
                  decoration: InputDecoration(
                      labelText: "Enter Vehicle Name",
                      labelStyle: TextStyle(
                          fontSize: width * 0.012,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade800),
                      // hintText: "pleace enter your name",
                      // hintStyle: TextStyle(
                      //   fontSize: width * 0.05,
                      //   fontWeight: FontWeight.w600,
                      // ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(width * 0.008),
                          borderSide: BorderSide(
                            color: colorPage.primaryColor,
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(width * 0.008),
                          borderSide: BorderSide(
                            color: colorPage.primaryColor,
                          ))),
                ),
              ),
              SizedBox(
                width: width * 0.01,
              ),
              GestureDetector(
                onTap: () {
                  FirebaseFirestore.instance
                      .collection("Vehicle")
                      .doc("Vehicles")
                      .update({
                    dropdown_value.toString():
                        FieldValue.arrayUnion([model_name_controller1.text])
                  });
                  model_name_controller1.clear();
                },
                child: Container(
                  height: width * 0.03,
                  width: width * 0.07,
                  child: Center(
                    child: Text("Add Vehicle",
                        style: TextStyle(color: Colors.white)),
                  ),
                  decoration: BoxDecoration(
                      color: colorPage.primaryColor,
                      borderRadius: BorderRadius.circular(width * 0.01)),
                ),
              )
            ],
          ),
          SizedBox(
            height: width * 0.03,
          ),
          Expanded(
            child: StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("Vehicle")
                    .doc("Vehicles")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }
                  var data = snapshot.data;
                  Map<String, dynamic> DataMap = data?.data() as Map<String, dynamic>;
                  List key = DataMap.keys.toList();

                  return ListView.separated(
                    itemCount: key.length,
                    itemBuilder: (BuildContext context, int index) {
                      List modelList = DataMap[key[index]];

                      return Container(
                        height: width * 0.04,
                        width: width * 1,
                        color: Colors.grey,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () {
                                    FirebaseFirestore.instance.collection("Vehicle").doc("Vehicles").update(
                                        {
                                          key[index]:FieldValue.arrayRemove([DataMap[key[index]]]),
                                          // modelList[index]:FieldValue.arrayRemove([DataMap]),
                                        });
                                    setState(() {
                                    });

                                  },

                                  child: Container(
                                      height: width*0.02,
                                      width: width*0.02,
                                      child: Icon(Icons.delete,color: Colors.blueAccent,)),
                                ),
                                Container(
                                  child: Text(key[index],style: TextStyle(fontSize: width*0.015,
                                  color: Colors.black)),
                                ),
                              ],
                            ),

                            // Text(key[index])
                            Container(
                              height: width * 0.02,
                              child: ListView.separated(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: modelList.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    height: width * 0.02,
                                    width: width * 0.08,
                                    color: Colors.white,
                                    child: Center(
                                        child:
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Expanded(child:
                                                Padding(
                                                  padding:  EdgeInsets.all(8.0),
                                                  child: Text(modelList[index].toString()),
                                                )),
                                                InkWell(
                                                    onTap: () {
                                                      FirebaseFirestore.instance.collection("Vehicle").doc("Vehicles").update(
                                                          {
                                                            key[index]:FieldValue.arrayRemove([modelList[index]]),
                                                            // modelList[index]:FieldValue.arrayRemove([DataMap]),
                                                          });
                                                      setState(() {
                                                      });

                                                    },
                                                    child: Container(
                                                        height: width*0.02,
                                                        width: width*0.02,
                                                        child: Icon(Icons.delete,color: Colors.red,)))
                                              ],
                                            )),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return SizedBox(width: width * 0.01);
                                },
                              ),
                            )
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
