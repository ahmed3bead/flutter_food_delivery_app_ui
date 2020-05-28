import 'package:flutterfooddeliveryappui/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// Ahmed Ebead :)
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Food',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.reemKufiTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: HomePage(),
    );
  }
}
