import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; //location name
  late String time; //the time in the location
  String flag; // url to flag asset
  String url;
  late bool isDayTime;

  WorldTime(
      {required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    Uri url = Uri.parse('http://worldtimeapi.org/api/timezone/${this.url}');
    Response response = await get(url);

    if (response.statusCode == 200) {
      try {
        Map data = jsonDecode(response.body);

        String datetime = data['datetime'];
        String offset = data['utc_offset'].substring(1, 3);

        DateTime now = DateTime.parse(datetime);
        now = now.add(Duration(hours: int.parse(offset)));

        time = DateFormat.jm().format(now);
        isDayTime = now.hour > 6 && now.hour < 20;

      } catch (e) {
        time = 'Could not get time';
      }
    }
  }
}
