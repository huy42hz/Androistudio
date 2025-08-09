import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';
import 'weather_service.dart';

class WeatherScreen extends StatefulWidget {
  final String city;

  const WeatherScreen({super.key, required this.city});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Map<String, dynamic>? weatherData;
  bool isLoading = false;

  Future<void> fetchWeather(String city) async {
    setState(() {
      isLoading = true;
    });

    final data = await WeatherService.fetchWeather(city);

    setState(() {
      weatherData = data;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchWeather(widget.city);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.lightBlueAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator(color: Colors.white)
              : weatherData != null
              ? WeatherInfo(data: weatherData!)
              : const Text(
            'No data',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
      ),
    );
  }
}

class WeatherInfo extends StatelessWidget {
  final Map<String, dynamic> data;

  const WeatherInfo({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final temp = data['main']['temp'].toDouble();
    final condition = data['weather'][0]['main'];
    final description = data['weather'][0]['description'];
    final wind = data['wind']['speed'];

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.location_on, color: Colors.white, size: 32),
        Text(
          data['name'],
          style: const TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        BoxedIcon(WeatherIcons.day_sunny, size: 64, color: Colors.yellowAccent),
        const SizedBox(height: 10),
        Text(
          '$temp°C',
          style: const TextStyle(fontSize: 56, color: Colors.white, fontWeight: FontWeight.w300),
        ),
        Text(
          '$condition - $description',
          style: const TextStyle(fontSize: 20, color: Colors.white70),
        ),
        const SizedBox(height: 10),
        Text(
          'Gió: ${wind} m/s',
          style: const TextStyle(fontSize: 18, color: Colors.white70),
        ),
      ],
    );
  }
}
