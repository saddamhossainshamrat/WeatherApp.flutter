import 'package:flutter/material.dart';

class Weathermodel extends StatefulWidget {
  @override
  _WeathermodelState createState() => _WeathermodelState();
}

class _WeathermodelState extends State<Weathermodel> {
  var cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Weather App')),
      ),
      //backgroundColor: Colors.amber,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/city.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 100,
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
              child: Container(
                padding: EdgeInsets.all(20),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Location Name',
                      hintText: 'Enter City Name'),
                  onChanged: (text) {
                    //print('My first value $text');
                    cityName = text;
                  },
                ),
              ),
            ),
            FlatButton(
              onPressed: () {
                Navigator.pop(context, cityName);
              },
              child: Text(
                "Get Location",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
