import 'package:clima_e_tempo/app/models/weather_model.dart';

class ClimateModel {
  final double latitude;
  final double longitude;
  final List<WeatherModel> weathers;
  final double temp;
  final double thermalSensation;
  final double tempMax;
  final double tempMin;
  final int pressure;
  final int humidity;
  final String name;
  final double windSpeed;
  ClimateModel({
    required this.latitude,
    required this.longitude,
    required this.weathers,
    required this.temp,
    required this.thermalSensation,
    required this.tempMax,
    required this.tempMin,
    required this.pressure,
    required this.humidity,
    required this.name,
    required this.windSpeed,
  });

  Map<String, dynamic> toMap() {
    return {
      'latitude': latitude,
      'longitude': longitude,
      'weathers': weathers.map((x) => x.toMap()).toList(),
      'temp': temp,
      'thermalSensation': thermalSensation,
      'tempMax': tempMax,
      'tempMin': tempMin,
      'pressure': pressure,
      'humidity': humidity,
      'name': name,
      'windSpeed': windSpeed
    };
  }

  factory ClimateModel.fromMap(Map<String, dynamic> map) {
    return ClimateModel(
        latitude: map['coord']['lat'],
        longitude: map['coord']['lon'],
        weathers: List<WeatherModel>.from(
            map['weather']?.map((x) => WeatherModel.fromMap(x))),
        temp: map['main']['temp'],
        thermalSensation: map['main']['feels_like'],
        tempMax: map['main']['temp_max'],
        tempMin: map['main']['temp_min'],
        pressure: map['main']['pressure'],
        humidity: map['main']['humidity'],
        name: map['name'],
        windSpeed: map['wind']['speed']);
  }
}
