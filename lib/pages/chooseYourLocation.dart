import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';
class ChooseYourLocation extends StatefulWidget {
  const ChooseYourLocation({super.key});

  @override
  State<ChooseYourLocation> createState() => _ChooseYourLocationState();
}

class _ChooseYourLocationState extends State<ChooseYourLocation> {

  // int counter =0;
  List<WorldTime> locations = [
    WorldTime(urlMain: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(urlMain: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(urlMain: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(urlMain: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(urlMain: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(urlMain: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(urlMain: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(urlMain: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime(index) async{
    WorldTime dummy = locations[index];
    await dummy.getTime();
    print(dummy.isDayNight);
    // navigate to home screen
    Map m = {
      'location' : dummy.location,
      'flag' : dummy.flag,
      'time' : dummy.time,
      'isDayTime' : dummy.isDayNight,
    };
    print(m);
    Navigator.pop(context,m);
  }
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

      //Building a list view builder

      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
              child: Card(
                child: ListTile(
                  onTap: (){
                    updateTime(index);
                    print(locations[index].location);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          },
      )
      // body:ElevatedButton(
      //   onPressed: (){
      //     setState(() {
      //       counter++;
      //     });
      //   },
      //   child: Text('$counter'),
      // )
      // body: Text('choose your location'),
    );
  }
}
