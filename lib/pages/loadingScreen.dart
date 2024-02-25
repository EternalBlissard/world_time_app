import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {

  void getTime() async{
    //Test
    // Response response=await get(Uri.https('jsonplaceholder.typicode.com','todos/1'));
    // Map data = jsonDecode(response.body);
    // print(data['userId']);

    // make the request
    Response response = await get(Uri.https('worldtimeapi.org','api/timezone/Europe/London'));
    Map data = jsonDecode(response.body);
    // print(data);

    //getting the properties from the data
    String dateTime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);
    print(dateTime);
    print(offset);

    //create Date Time Object
    DateTime now = DateTime.parse(dateTime);
    now=now.add(Duration(hours: int.parse(offset)+1));
    print(now);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // print('initState  function ran');
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('loader'),
    );
  }
}
