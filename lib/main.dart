import 'package:admin_app/count_admin.dart';
import 'package:admin_app/firebase_options.dart';
import 'package:admin_app/first_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.web
  );
  runApp(carWash());
}

var width;
var height;

class carWash extends StatelessWidget {
  const carWash({super.key});
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        FocusManager();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: count_admin(),
      ),
    );
  }
}

class colorPage {
  static const primaryColor = Color(0xff001855);
}
