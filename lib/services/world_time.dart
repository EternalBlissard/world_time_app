import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
class WorldTime{
  //Location name for the UI
  String location='';
  //Time at the location
  String time='';
  //Url of the Flag Icon
  String flag='';
  //Constant String URL for api
  String urlMain='';
  //Additional String URL
  // String AdditonalURL = 'api/timezone/';
  //true or false depending day or night
  bool isDayNight=false;

  WorldTime({required this.location, required this.urlMain, required this.flag});

  Future <void> getTime() async{
    //Test
    // Response response=await get(Uri.https('jsonplaceholder.typicode.com','todos/1'));
    // Map data = jsonDecode(response.body);
    // print(data['userId']);

    try{
      // make the request
      Response response = await get(Uri.https('worldtimeapi.org','api/timezone/$urlMain'));
      Map data = jsonDecode(response.body);
      // print(data);

      //getting the properties from the data
      String dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
      int mul = (data['utc_offset'].substring(0,1)=='-')? -1 :1;
      print(dateTime);
      print(offset);

      //create Date Time Object
      DateTime now = DateTime.parse(dateTime);
      now=now.add(Duration(hours: (int.parse(offset) * mul)));
      print(now);

      isDayNight= now.hour > 6 && now.hour < 20 ? true : false;
      print("hi $isDayNight");
      //set the property
      time = DateFormat.jm().format(now);
    }
    catch(e){
      // print(e);
      print("Failure");
      print("Caught error :$e");
      time = 'could not fetch time data';
    }

  }

}


// instance.getTime();