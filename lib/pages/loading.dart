import "package:flutter/material.dart";
import "package:flutter_time_app/services/world_time_service.dart";
import "package:flutter_spinkit/flutter_spinkit.dart";

class Loading extends StatefulWidget {
  const Loading({super.key});
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = "Loading";
  WorldTime instance =
      WorldTime(location: "London", flag: "germany.png", url: "Europe/London");
  void setupWorldTime() async {
    await instance.getTime();

    _switchToHome();
  }

  void _switchToHome() {
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      "flag": instance.flag,
      "time": instance.time,
      "isDayTime": instance.isDayTime
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        body: Center(
          child: SpinKitWaveSpinner(
            color: Colors.deepPurple,
            size: 50.0,
          ),
        ));
  }
}
