import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextButton.icon(
              icon: const Icon(Icons.edit_location, color: Colors.white),
              onPressed: () {
                Navigator.pushNamed(context, '/location');
              },
              label: const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: Text(
                  'Choose Location',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue)),
            )
          ],
        ),
      ),
    );
  }
}
