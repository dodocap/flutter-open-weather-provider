import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  final String description;
  final String icon;
  final double temp;
  final double tempMin;
  final double tempMax;
  final String name;
  final String country;
  final DateTime lastUpdates;

  Weather({
    required this.description,
    required this.icon,
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.name,
    required this.country,
    required this.lastUpdates,
  });

  factory Weather.initial() => Weather(
        description: '',
        icon: '',
        temp: 100.0,
        tempMin: 100.0,
        tempMax: 100.0,
        name: '',
        country: '',
        lastUpdates: DateTime(1970),
      );

  factory Weather.fromJson(Map<String, dynamic> json) {
    final weather = json['weather'][0];
    final main = json['main'];

    return Weather(
      description: weather['description'] as String,
      icon: weather['icon'] as String,
      temp: main['temp'] as double,
      tempMin: main['temp_min'] as double,
      tempMax: main['temp_max'] as double,
      name: '',
      country: '',
      lastUpdates: DateTime.now(),
    );
  }

  @override
  List<Object?> get props => [ description, icon, temp, tempMin, tempMax, name, country, lastUpdates ];

  @override
  bool? get stringify => true;

  Weather copyWith({
    String? description,
    String? icon,
    double? temp,
    double? tempMin,
    double? tempMax,
    String? name,
    String? country,
    DateTime? lastUpdates,
  }) {
    return Weather(
      description: description ?? this.description,
      icon: icon ?? this.icon,
      temp: temp ?? this.temp,
      tempMin: tempMin ?? this.tempMin,
      tempMax: tempMax ?? this.tempMax,
      name: name ?? this.name,
      country: country ?? this.country,
      lastUpdates: lastUpdates ?? this.lastUpdates,
    );
  }
}
