import 'package:http/http.dart';
import "dart:convert";

class WorldTime {
  late String location; // Location for the URI
  late String time; // Time for the Location
  late String flag; // Url to an asset flag Icon
  late String url; // Location url for the api endpoint

  WorldTime({required this.location, required this.flag, required this.url});
  Future<void> getTime() async {
    try {
      Uri uri = Uri.parse('https://worldtimeapi.org/api/timezone/$url');
      Response response = await get(uri);
      Map data = jsonDecode(response.body);

      String datetime = data['utc_datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      //Set time property
      time = now.toString();
      print('Time $time');
    } catch (ex) {
      print(ex);
    }
  }
}
