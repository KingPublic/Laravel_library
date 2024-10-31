class Suhu {
  double _celsius;

  Suhu({required double celsius}) : _celsius = celsius;

  double get celsius => _celsius;
  set celsius(double value) => _celsius = value;

  double toReaumur() => _celsius * 0.8;
  double toFahrenheit() => (_celsius * 9 / 5) + 32;
  double toKelvin() => _celsius + 273.15;
}