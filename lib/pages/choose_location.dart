import "package:flutter/material.dart";
import "package:flutter_time_app/services/world_time_service.dart";

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int counter = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  List<WorldTime> locations = [
    WorldTime(url: "Europe/London", location: "london", flag: 'uk.png'),
    WorldTime(url: "Africa/Cairo", location: "Athens", flag: "greece.png"),
    WorldTime(url: "America/Chichago", location: "Chichago", flag: "usa.png"),
    WorldTime(url: "Asia/Tokyo", location: "Tokyo", flag: "south_korea.png"),
    WorldTime(url: "Asia/Seoul", location: "Seoul", flag: "south_korea.png"),
    WorldTime(url: "America/New_York", location: "Newyork", flag: "usa.png"),
    WorldTime(url: "Africa/Nairobi", location: "Nairobi", flag: "kenya.png")
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    sendHome(instance);
  }

  void sendHome(instance) {
    Navigator.pop(context, {
      'location': instance.location,
      "flag": instance.flag,
      "time": instance.time,
      "isDayTime": instance.isDayTime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.indigo[800],
          elevation: 0,
          title: const Text('Choose Location',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
        ),
        backgroundColor: Colors.grey[100],
        body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
                child: Card(
                    child: ListTile(
                        onTap: () {
                          updateTime(index);
                        },
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(
                              "assets/images/${locations[index].flag}"),
                        ),
                        title: Text(locations[index].location))));
          },
        ));
  }
}
