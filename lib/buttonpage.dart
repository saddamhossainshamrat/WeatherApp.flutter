import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';

import 'weather.dart';
import 'locationData.dart';

class ButtonPage extends StatefulWidget {
  const ButtonPage({Key? key}) : super(key: key);

  @override
  State<ButtonPage> createState() => _ButtonPageState();
}

class _ButtonPageState extends State<ButtonPage> {
  void geolocator() async {
    LocationData locData = LocationData();

    var weatherData = await locData.getData();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Weather(weatherData),
      ),
    );

    // LocationPermission permission = await Geolocator.requestPermission();
  }

  @override
  Widget build(BuildContext context) {
    geolocator();

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 175,
          ),
          Image(
            image: AssetImage("images/logo.png"),
            height: 100,
            width: 100,
          ),
          Center(
            child: Text(
              'Simple Weather App',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w900,
                color: Colors.blue,
              ),
            ),
          ),
          Center(
            child: Text(
              'Find Your City Weather',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
          ),
          Text(
            'by Saddam Hossain Shamrat',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
          Center(
            child: SpinKitCircle(
              color: Colors.blueAccent,
              size: 50,
              duration: Duration(milliseconds: 3000),
            ),
          ),
        ],
      ),
    );

    //geolocator();
    // return Center(
    //   child: FlatButton(
    //     onPressed: () {
    //       geolocator();
    //     },
    //     child: Text("Get Location"),
    //     color: Colors.red,
    //   ),
    // );
  }
}
