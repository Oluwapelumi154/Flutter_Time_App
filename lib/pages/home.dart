import "package:flutter/material.dart";

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          TextButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, "/location");
              },
              icon: const Icon(
                Icons.edit_location,
              ),
              label:
                  const Text('Edit Location', style: TextStyle(fontSize: 19.0)))
        ],
      ),
    ));
  }
}
