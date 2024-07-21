import "package:flutter/material.dart";
import "package:flutter_time_app/services/world_time_service.dart";
import 'package:http/http.dart';
import "dart:convert";

class Loading extends StatefulWidget {
  const Loading({super.key});
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = "Loading";
  void setupWorldTime() async {
    WorldTime instance = WorldTime(
        location: "London", flag: "germany.png", url: "Europe/London");
    await instance.getTime();
    setState(() {
      time = instance.time;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupWorldTime();
    print('Got here');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(padding: const EdgeInsets.all(50.0), child: Text(time)));
  }
}
