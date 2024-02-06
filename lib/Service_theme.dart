import 'package:admin_app/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import 'Model/service_model.dart';

class Service_theme extends StatefulWidget {
  const Service_theme({super.key});

  @override
  State<Service_theme> createState() => _Service_themeState();
}

class _Service_themeState extends State<Service_theme> {
  List service=[];
  PlatformFile? pickFile;
  UploadTask? uploadTask;
  String? urlDownlod ="";
  Future selectFileToMessage(String name) async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    pickFile = result.files.first;

    final fileBytes = result.files.first.bytes;


    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Uploading...")));
    uploadFileToFireBase(name, fileBytes);

    setState(() {});
  }

  Future uploadFileToFireBase(String name, fileBytes) async {
    uploadTask = FirebaseStorage.instance
        .ref('icon/${DateTime.now().toString()}-$name')
        .putData(fileBytes,SettableMetadata(
        contentType: 'image/jpeg'
    ));
    final snapshot = await uploadTask?.whenComplete(() {});
    urlDownlod = (await snapshot?.ref?.getDownloadURL())!;

    await Future.delayed(const Duration(seconds: 2));
    setState(() {});
  }


  TextEditingController nameController=TextEditingController();
  TextEditingController motoController=TextEditingController();
  TextEditingController descriptionController=TextEditingController();

  TextEditingController serviceController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("SERVICE THEME"),
        backgroundColor: colorPage.primaryColor,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: width*0.4,
                height: width*0.3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        urlDownlod != ""
                            ? Container(
                            height: width * 0.08,
                            width: width * 0.08,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(width*0.01),
                              border: Border.all(color: colorPage.primaryColor,width: width*0.003),
                                image: DecorationImage(
                                    image: NetworkImage(urlDownlod!),
                                    fit: BoxFit.contain)))
                            : Container(
                            height: width * 0.08,
                            width: width * 0.08,
                            child: Container(
                                height: width * 0.01,
                                width: width * 0.01,
                                child: Center(
                                    child: SvgPicture.asset(
                                      "assets/image-upload-svgrepo-com (3).svg",
                                      height: width * 0.06,
                                      width: width * 0.06,
                                    ))),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(width * 0.015),
                                color: colorPage.primaryColor)),
                        SizedBox(width: width*0.01,),
                        GestureDetector(
                          onTap: () {
                            selectFileToMessage("img");
                          },
                          child: Container(
                            height: width * 0.03,
                            width: width * 0.04,
                            child: Center(
                              child: Text("Add",
                                  style: TextStyle(color: Colors.white)),
                            ),
                            decoration: BoxDecoration(
                                color: colorPage.primaryColor,
                                borderRadius: BorderRadius.circular(width * 0.01)),
                          ),
                        )

                      ],
                    ),
                    Container(
                      height: width * 0.03,
                      width: width * 0.3,
                      // color: Colors.yellow,
                      child: TextFormField(
                        controller: nameController,
                        textCapitalization: TextCapitalization.words,
                        keyboardType: TextInputType.multiline,
                        textInputAction: TextInputAction.done,
                        style: TextStyle(
                            fontSize: width * 0.013,
                            fontWeight: FontWeight.w400,
                            color: colorPage.primaryColor),
                        decoration: InputDecoration(
                            labelText: "service theme",
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
                    Container(
                      height: width * 0.03,
                      width: width * 0.3,
                      // color: Colors.yellow,
                      child: TextFormField(
                        controller: motoController,
                        textCapitalization: TextCapitalization.words,
                        keyboardType: TextInputType.multiline,
                        textInputAction: TextInputAction.done,
                        style: TextStyle(
                            fontSize: width * 0.013,
                            fontWeight: FontWeight.w400,
                            color: colorPage.primaryColor),
                        decoration: InputDecoration(
                            labelText: "enter your moto",
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
                    Container(
                      height: width * 0.03,
                      width: width * 0.3,
                      // color: Colors.yellow,
                      child: TextFormField(
                        controller: descriptionController,
                        textCapitalization: TextCapitalization.words,
                        keyboardType: TextInputType.multiline,
                        textInputAction: TextInputAction.done,
                        style: TextStyle(
                            fontSize: width * 0.013,
                            fontWeight: FontWeight.w400,
                            color: colorPage.primaryColor),
                        decoration: InputDecoration(
                            labelText: "Enter description",
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

                    Container(
                      height: width * 0.03,
                      width: width * 0.3,
                      // color: Colors.yellow,
                      child: TextFormField(
                        controller: priceController,
                        textCapitalization: TextCapitalization.words,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        style: TextStyle(
                            fontSize: width * 0.013,
                            fontWeight: FontWeight.w400,
                            color: colorPage.primaryColor),
                        decoration: InputDecoration(
                            labelText: "enter your price",
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
                  ],
                ),
              ),

              Padding(
                padding:  EdgeInsets.only(top: width*0.03),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: width * 0.01,
                        ),
                        Container(
                          height: width * 0.03,
                          width: width * 0.3,
                          child: TextFormField(
                            controller: serviceController,
                            textCapitalization: TextCapitalization.words,
                            keyboardType: TextInputType.multiline,
                            textInputAction: TextInputAction.done,
                            style: TextStyle(
                                fontSize: width * 0.013,
                                fontWeight: FontWeight.w400,
                                color: colorPage.primaryColor),
                            decoration: InputDecoration(
                                labelText: "Enter service list",
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

                            service.add(serviceController.text);
                            serviceController.clear();
                            setState(() {
                            });
                          },
                          child: Container(
                            height: width * 0.03,
                            width: width * 0.05,
                            child: Center(
                              child: Text("Add ",
                                  style: TextStyle(color: Colors.white)),
                            ),
                            decoration: BoxDecoration(
                                color: colorPage.primaryColor,
                                borderRadius: BorderRadius.circular(width * 0.01)),
                          ),
                        )
                      ],
                    ),
                  SizedBox(height: width*0.02),
                      Container(
                  height: width*0.3,
                  width: width*0.4,
                  // color: Colors.red,
                        child: ListView.separated(
                          itemCount:service.length,
                          itemBuilder: (context, index) {
                            return Container(
                              // margin: EdgeInsets.only(top: width*0.004),
                              height: width*0.04,
                              width: width*0.4,
                              decoration: BoxDecoration(
                                  color: colorPage.primaryColor,

                                borderRadius: BorderRadius.circular(width*0.01)
                              ),
                              child: Center(
                                child: Text(service[index].toString(),style: TextStyle(
                                  fontSize: width*0.02,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white
                                ),),
                              )
                            );


                          }, separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(height: width*0.01);
                        },),
                      )
                  ],
                ),
              )

            ],
          ),
          InkWell(
            onTap: () {

              if(urlDownlod ==""){
                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("enter service images")));
                 return;
              }
              if(nameController.text ==""){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("enter service theme")));
                return;
              }
              if(motoController.text ==""){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("enter service moto")));
                return;
              }
              if(descriptionController.text ==""){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("enter service description")));
                return;
              }
              if(priceController.text.isEmpty){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("enter service price")));
                return;
              }
              if(service.isEmpty){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("enter service list")));
                return;
              }

              ServiceModel ServiceModelData=ServiceModel(
                  icon: urlDownlod.toString(),
                name: nameController.text,
                moto: motoController.text,
                description: descriptionController.text,
                service: service,
                price: num.parse(priceController.text),
              );
              FirebaseFirestore.instance.collection("service").add(ServiceModelData.toMap());

              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("upload succsses")));
              nameController.clear();
              motoController.clear();
              descriptionController.clear();
              priceController.clear();
              service.clear();
            },
            child: Container(
              height: width * 0.04,
              width: width * 0.06,
              child: Center(
                child: Text("Upload ",
                    style: TextStyle(color: Colors.white)),
              ),
              decoration: BoxDecoration(
                  color: colorPage.primaryColor,
                  borderRadius: BorderRadius.circular(width * 0.01)),
            ),
          ),


        ],
      ),
    );
  }
}
