// ignore_for_file: avoid_print, unused_local_variable

import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'network.dart';
import 'location.dart';
import 'weather.dart';

const String apikey = '6e6c46d65723a9503556814124b8982b';

class LocationData {
  double? latitute;
  double? longitude;

  Future<dynamic> getData() async {
    Location loc = Location();

    await loc.getlocation();
    latitute = loc.latitude;
    longitude = loc.longitude;
    // print(latitute);
    // print(longitude);

    Network network = Network(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitute&lon=$longitude&appid=6e6c46d65723a9503556814124b8982b&units=metric');

    var weatherData = await network.networkData();
    return weatherData;
  }

  Future<dynamic> getCityWeather(cityName) async {
    var url =
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=6e6c46d65723a9503556814124b8982b&units=metric';
    Network network = Network(url);
    var weatherData = await network.networkData();
    return weatherData;
  }
}
