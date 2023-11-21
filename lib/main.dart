import 'package:flutter/material.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: WeatherView(),
        ),
      ),
    );
  }
}

class WeatherView extends StatefulWidget {
  const WeatherView({super.key});

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  final yumemiWeather = YumemiWeather();

  void reload() {
    final weatherCondition = yumemiWeather.fetchSimpleWeather();
    print('Weather Condition: $weatherCondition');
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 80 + 48),
        Flexible(
          child: SizedBox(
            width: width / 2,
            height: width / 2,
            child: const Placeholder(),
          ),
        ),
        Flexible(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: width / 2,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      '** ℃',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: Colors.blue,
                          ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '** ℃',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: Colors.red,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 80),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: width / 2,
          ),
          child: Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Close'),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: reload,
                  child: const Text('Reload'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
