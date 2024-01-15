import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import 'main.dart';

class banner_page extends StatefulWidget {
  const banner_page({super.key});

  @override
  State<banner_page> createState() => _banner_pageState();
}

class _banner_pageState extends State<banner_page> {
  PlatformFile? pickFile;
  UploadTask? uploadTask;
  String? urlDownlod;
  Future selectFileToMessage(String name) async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    pickFile = result.files.first;

    // String? ext = pickFile?.name?.split('.')?.last;
    final fileBytes = result.files.first.bytes;

    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Uploading...")));
    uploadFileToFireBase(name, fileBytes);

    setState(() {});
  }

  Future uploadFileToFireBase(String name, fileBytes) async {
    uploadTask = FirebaseStorage.instance
        .ref('banner/${DateTime.now().toString()}-$name')
        .putData(fileBytes,SettableMetadata(
      contentType: 'image/jpeg'
    ));
    final snapshot = await uploadTask?.whenComplete(() {});
    urlDownlod = (await snapshot?.ref?.getDownloadURL())!;

    // ignore: use_build_context_synchronously
    // showUploadMessage(context, '$name Uploaded Successfully...');
    await Future.delayed(const Duration(seconds: 2));
    // ignore: use_build_context_synchronously
    // ScaffoldMessenger.of(context).clearSnackBars();
    setState(() {});
  }

  // String imageurl ='';
  // //
  // File? file;
  // // pickFile(ImageSource) async {
  // //   final imageFile = await ImagePicker.platform.pickImage(source: ImageSource);
  // //   file = File(imageFile!.path);
  // //   if (mounted) {
  // //     setState(()  {
  // //       file = File(imageFile.path);
  // //     });
  // //   }
  // //
  // //   if(imageFile!= null){
  // //     var ab=await imageFile.readAsBytes();
  // //   }
  // // }
  //
  // uploadFile() async {
  //   if(file!=null) {
  //     var uploadTask = await FirebaseStorage.instance.ref("images").child(
  //         '${DateTime.now()}').putFile(file!);
  //
  //     imageurl = await uploadTask.ref.getDownloadURL();
  //
  //
  //     print(imageurl);
  //     setState(() {
  //
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BANNER"),
        backgroundColor: colorPage.primaryColor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Container(
              //     height: width * 0.3,
              //     width: width * 0.4,
              //     decoration: BoxDecoration(
              //         image: DecorationImage(
              //             image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/first-project-ad8e4.appspot.com/o/uploads%2F2023-12-27%2013%3A53%3A15.189-ashik.png?alt=media&token=256927a2-7988-49d8-9328-57d48982be73"), fit: BoxFit.cover)
              //     )
              // ),

              SizedBox(height:width*0.02),
              urlDownlod != null
                  ? Container(
                      height: width * 0.2,
                      width: width * 0.3,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(urlDownlod!),
                              fit: BoxFit.cover)))
                  : Container(
                      height: width * 0.2,
                      width: width * 0.3,
                      child: Container(
                          height: width * 0.05,
                          width: width * 0.05,
                          child: Center(
                              child: SvgPicture.asset(
                            "assets/image-upload-svgrepo-com (3).svg",
                            height: width * 0.13,
                            width: width * 0.13,
                          ))),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(width * 0.015),
                          color: colorPage.primaryColor)),
              SizedBox(height: width * 0.03),

              GestureDetector(
                onTap: () {
                  selectFileToMessage("ashik");
                },
                child: Container(
                  height: width * 0.03,
                  width: width * 0.15,
                  decoration: BoxDecoration(
                      color: colorPage.primaryColor,
                      borderRadius: BorderRadius.circular(width * 0.015)),
                  child: Center(
                    child: Text("Add",
                        style: TextStyle(
                            fontSize: width * 0.02, color: Colors.white)),
                  ),
                ),
              ),
              SizedBox(
                height: width * 0.02,
              ),
              GestureDetector(
                onTap: () {
                  uploadTask != null
                      ? FirebaseFirestore.instance
                          .collection("banner")
                          .doc("images")
                          .update({
                          "images": FieldValue.arrayUnion([urlDownlod]),
                        })
                      : ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Sorry! Image not add")));

                },
                child: Container(
                  height: width * 0.03,
                  width: width * 0.15,
                  decoration: BoxDecoration(
                      color: colorPage.primaryColor,
                      borderRadius: BorderRadius.circular(width * 0.015)),
                  child: Center(
                    child: Text("uploads",
                        style: TextStyle(
                            fontSize: width * 0.02, color: Colors.white)),
                  ),
                ),
              ),
              SizedBox(
                height: width * 0.02,
              ),
              uploadTask != ""
                  ? Container(
                      height: width * 0.8,
                      width: width * 1,
                      child: StreamBuilder<DocumentSnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection("banner")
                              .doc("images")
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return Center(child: CircularProgressIndicator());
                            }
                            var data = snapshot.data;
                            List banners = data!['images'];
                            return ListView.builder(
                              itemCount: banners.length,
                              itemBuilder: (context, index) {
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        margin: EdgeInsets.all(width * 0.01),
                                        height: width * 0.1,
                                        width: width * 0.2,
                                        decoration: BoxDecoration(
                                            color: colorPage.primaryColor,
                                            borderRadius: BorderRadius.circular(
                                                width * 0.015)),
                                        child: Image(
                                            image: NetworkImage(banners[index]),
                                            fit: BoxFit.cover)),
                                    GestureDetector(
                                      onTap: () {
                                        FirebaseFirestore.instance
                                            .collection("banner")
                                            .doc("images")
                                            .update({
                                          "images": FieldValue.arrayRemove(
                                              [banners[index]])
                                        });
                                      },
                                      child: Container(
                                        height: width * 0.03,
                                        width: width * 0.15,
                                        decoration: BoxDecoration(
                                            color: colorPage.primaryColor,
                                            borderRadius: BorderRadius.circular(
                                                width * 0.015)),
                                        child: Center(
                                          child: Text("Delete",
                                              style: TextStyle(
                                                  fontSize: width * 0.02,
                                                  color: Colors.white)),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          }),
                    )
                  : CircularProgressIndicator(
                      color: colorPage.primaryColor,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
