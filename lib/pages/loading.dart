import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getTime() async {
      Uri url = Uri.parse('http://worldtimeapi.org/api/timezone/Europe/Lisbon');
      Response response = await get(url);

      if(response.statusCode == 200){
        Map data = jsonDecode(response.body);

        String datetime = data['datetime'];
        String offset = data['utc_offset'].substring(1,3);


        DateTime now = DateTime.parse(datetime);
        now = now.add(Duration(hours: int.parse(offset)));
      }
  }

  @override
  void initState() {
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('Loading'),
    );
  }
}
