import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:world_time_app/services/world_time.dart';
// import 'package:flutter_spinkit/src/';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {

  // String currTime = 'loading';
  void setupWorldTime() async{
    WorldTime instance = WorldTime(location: 'Berlin', urlMain: 'Europe/Berlin', flag: 'germany.png');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location' : instance.location,
      'flag' : instance.flag,
      'time' : instance.time,
      'isDayTime' : instance.isDayNight,
    });
    // print(instance.time);
    // setState(() {
    //   currTime = instance.time;
    // });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // print('initState  function ran');
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body:Center(
        child: SpinKitFadingCircle(
          color: Colors.white,
          size: 80.0,
          // controller: AnimationController(vsync: this, duration: const Duration(milliseconds: 1200)),
        ),
      ),

      // body: Padding(
      //   padding: EdgeInsets.all(50.0),
      //   child: Text('loading'),
      // ),
    );
  }
}
