import 'package:flutter/material.dart';
// import 'pages/homePage.dart';
import 'package:world_time_app/pages/homePage.dart';
import 'package:world_time_app/pages/chooseYourLocation.dart';
import 'package:world_time_app/pages/loadingScreen.dart';
void main() => runApp(MaterialApp(
  //home: LoadingPage() ,
  initialRoute: '/',
  routes: {
    '/': (context) => LoadingPage(),
    '/home' : (context) => Home(),
    '/location' : (context) => ChooseYourLocation(),
  },
));

