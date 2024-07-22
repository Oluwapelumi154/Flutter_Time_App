import "package:flutter/material.dart";

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<dynamic, dynamic> data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map<dynamic, dynamic>;
    print(data);
    String bgImage = data['isDayTime'] ? "day1.png" : 'night.jpg';
    Color? bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo[900];
    return Scaffold(
        backgroundColor: bgColor,
        body: SafeArea(
          child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/$bgImage'),
                      fit: BoxFit.cover)),
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      TextButton.icon(
                          onPressed: () async {
                            dynamic result =
                                await Navigator.pushNamed(context, "/location");
                            setState(() {
                              data = {
                                "time": result['time'],
                                "location": result['location'],
                                "isDayTime": result['isDayTime'],
                                "flag": result['flag']
                              };
                            });
                          },
                          icon: Icon(Icons.edit_location,
                              color: Colors.grey[300]),
                          label: const Text('Edit Location',
                              style: TextStyle(
                                  fontSize: 19.0, color: Colors.white))),
                      const SizedBox(height: 40.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(data['location'],
                              style: TextStyle(
                                  fontSize: 32.0,
                                  color: Colors.grey[300],
                                  letterSpacing: 2.0,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const SizedBox(height: 40.0),
                      Text(data['time'],
                          style:
                              TextStyle(fontSize: 66.0, color: Colors.white)),
                    ],
                  ))),
        ));
  }
}
