import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';
import 'package:world_time_app/pages/loadingScreen.dart';
import 'package:world_time_app/pages/chooseYourLocation.dart';
import 'package:intl/intl.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map dataCurr= {};

  @override
  Widget build(BuildContext context) {

    dataCurr = ModalRoute.of(context)!.settings.arguments as Map;
    print(dataCurr);
    // time
    return Scaffold(
      body:SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Column(
            children: <Widget>[
              TextButton.icon(
              onPressed: (){
                Navigator.pushNamed(context, '/location');
              },
              label: Text('Edit Location'),
              icon: Icon(Icons.edit_location)),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                      dataCurr['location'],
                      style: TextStyle(
                        fontSize: 28,
                        letterSpacing: 2,
                      ),
                  ),
                ],
              ),
              SizedBox(height:20),
              Text(
                dataCurr['time'],
                style: TextStyle(
                  fontSize: 66.0,
                ),
              ),
            ],
          ),
        ),
        // child: Text(
        //   'home Screen',
        //   // style: TextStyle(
        //   //   color: Colors.red,
        //   // ),
        // ),
      ),
    );
  }
}
