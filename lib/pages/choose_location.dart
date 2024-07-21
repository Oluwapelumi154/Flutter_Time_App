import "package:flutter/material.dart";

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
    print('InitState function Run');
  }

  @override
  Widget build(BuildContext context) {
    print('Build Function');
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: const Text('Choose Location',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
          backgroundColor: Colors.deepPurple[600],
        ),
        backgroundColor: Colors.white,
        body: ElevatedButton(
          child: Text('counter is $counter'),
          onPressed: () {
            setState(() {
              counter++;
            });
          },
        ));
  }
}
