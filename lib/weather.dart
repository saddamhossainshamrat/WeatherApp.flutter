import 'package:class_32/weathermodel.dart';
import 'package:flutter/material.dart';
import 'locationData.dart';

class Weather extends StatefulWidget {
  final locationweather;

  Weather(this.locationweather);

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  late var tem;
  late String des;
  late String country;
  late String city;
  late var hum;
  late var win;
  late var cloud;
  DateTime now = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.locationweather);

    updateUI(widget.locationweather);
  }

  void updateUI(weatherData) {
    setState(() {
      if (weatherData == null) {
        tem = 'Not Found!';
        des = 'Empty';
        country = '';
        city = 'Empty';
        hum = 'Empty';
        win = 'Empty';
        cloud = 'Empty';
      } else {
        tem = weatherData['main']['temp'];
        des = weatherData['weather'][0]['description'];
        country = weatherData['sys']['country'];
        city = weatherData['name'];
        hum = weatherData['main']['humidity'];
        win = weatherData['wind']['speed'];
        cloud = weatherData['clouds']['all'];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Weather App')),
      ),
      // backgroundColor: Colors.yellow,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/back.png"),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                //textBaseline: TextBaseline.alphabetic,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 80,
                      ),
                      Text(
                        '$city, $country',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '$now',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$tem\u00B0C',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.wb_cloudy_rounded,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '$des',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 15),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Wind',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  '$win',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  'km/h',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Stack(
                                  children: [
                                    Container(
                                      height: 5,
                                      width: 50,
                                      color: Colors.white38,
                                    ),
                                    Container(
                                      height: 5,
                                      width: 2,
                                      color: Colors.greenAccent,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  'Clouds',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  '$cloud',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  '%',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Stack(
                                  children: [
                                    Container(
                                      height: 5,
                                      width: 50,
                                      color: Colors.white38,
                                    ),
                                    Container(
                                      height: 5,
                                      width: 2,
                                      color: Colors.redAccent,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  'Humidy',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  '$hum',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  '%',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Stack(
                                  children: [
                                    Container(
                                      height: 5,
                                      width: 50,
                                      color: Colors.white38,
                                    ),
                                    Container(
                                      height: 5,
                                      width: 2,
                                      color: Colors.redAccent,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: [
                FlatButton(
                  onPressed: () async {
                    var citynameData = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Weathermodel();
                        },
                      ),
                    );
                    print(citynameData);
                    var weatherData =
                        await LocationData().getCityWeather(citynameData);
                    updateUI(weatherData);
                  },
                  child: Text(
                    "Search Location",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 5,
                ),
                FlatButton(
                  onPressed: () async {
                    LocationData locData = LocationData();

                    var weatherData = await locData.getData();

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Weather(weatherData),
                      ),
                    );
                  },
                  child: Text(
                    "Reset",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  color: Colors.blue,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
