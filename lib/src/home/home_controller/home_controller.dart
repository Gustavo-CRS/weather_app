import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  String temperature = '';

  @observable
  String description = '';

  @observable
  String error = '';

  @computed
  bool get loading => temperature.isEmpty && description.isEmpty;

  @action
  Future<void> fetchCurrentLocationWeather() async {
    try {
      Position position = await _determinePosition();
      await fetchWeather(position.latitude, position.longitude);
    } catch (e) {
      error = e.toString();
    }
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  @action
  Future<void> fetchWeather(double latitude, double longitude) async {
    final apiKey = dotenv.env['API_KEY'];
    final url =
        'http://api.weatherapi.com/v1/current.json?key=$apiKey&q=$latitude,$longitude';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        temperature = '${data['current']['temp_f']}°F';
        description = data['current']['condition']['text'];
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      error = e.toString();
    }
  }
}
