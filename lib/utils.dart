enum WeatherType {
  sunny,
  cloudy,
  rainy;

  static WeatherType? fromName(String name) {
    try {
      return WeatherType.values.byName(name);
      // ignore: avoid_catching_errors
    } on ArgumentError {
      return null;
    }
  }
}
