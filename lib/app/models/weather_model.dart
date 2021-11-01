class WeatherModel {
  final String type;
  final String details;

  WeatherModel(this.type, this.details);

  Map<String, dynamic> toMap() {
    return {
      'main': type,
      'description': details,
    };
  }

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    return WeatherModel(
      map['main'],
      map['description'],
    );
  }
}
