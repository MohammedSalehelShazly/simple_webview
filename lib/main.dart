import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wepview_app/home.dart';
import 'package:wepview_app/provider.dart';

void main() {
  runApp(
      ChangeNotifierProvider(
        create: (_)=>MyProvider(),
        child: MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Home()
    );
  }
}

