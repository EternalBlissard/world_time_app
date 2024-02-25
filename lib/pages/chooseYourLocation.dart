import 'package:flutter/material.dart';

class ChooseYourLocation extends StatefulWidget {
  const ChooseYourLocation({super.key});

  @override
  State<ChooseYourLocation> createState() => _ChooseYourLocationState();
}

class _ChooseYourLocationState extends State<ChooseYourLocation> {

  int counter =0;


  @override
  Widget build(BuildContext context) {
    print('Something did run');
    return Scaffold(

      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text('Choose a location'),
        centerTitle: true,
        elevation: 0,
      ),
      body:ElevatedButton(
        onPressed: (){
          setState(() {
            counter++;
          });
        },
        child: Text('$counter'),
      )
      // body: Text('choose your location'),
    );
  }
}
