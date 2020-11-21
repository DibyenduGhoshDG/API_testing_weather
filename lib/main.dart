import 'package:api_testing_weather/weather_model.dart';
import 'package:api_testing_weather/weather_repo.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();

  double weather;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Application'),
      ),
      body: Column(
        children: [
          Text(
            weather == null ? 'Search by city name' : weather.toString(),
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          TextField(
            controller: controller,
          ),
          RaisedButton(
              color: Colors.cyan,
              onPressed: () async {
                WeatherModel weatherModel =
                    await WeatherRepo().getWeather(controller.text);
                setState(() {
                  weather = weatherModel.getTemp;
                });
              },
              child: Text('Search')),
        ],
      ),
    );
  }
}
