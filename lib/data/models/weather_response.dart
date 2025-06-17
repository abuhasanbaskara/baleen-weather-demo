import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'weather_response.g.dart';

@HiveType(typeId: 0)
class WeatherResponse extends Equatable {
  @HiveField(0)
  final String? cod;

  @HiveField(1)
  final int? message;

  @HiveField(2)
  final int? cnt;

  @HiveField(3)
  final List<WeatherData>? list;

  @HiveField(4)
  final City? city;

  //custom field
  @HiveField(5)
  final bool isCurrentLocation;

  const WeatherResponse({
    this.cod,
    this.message,
    this.cnt,
    this.list,
    this.city,
    this.isCurrentLocation = false,
  });

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    return WeatherResponse(
      cod: json['cod'] as String?,
      message: json['message'] as int?,
      cnt: json['cnt'] as int?,
      list: (json['list'] as List<dynamic>?)
          ?.map((item) => WeatherData.fromJson(item as Map<String, dynamic>))
          .toList(),
      city: json['city'] != null ? City.fromJson(json['city'] as Map<String, dynamic>) : null,
    );
  }

  // use copyWith to avoid error and safely input or edit data
  WeatherResponse copyWith({
    String? cod,
    int? message,
    int? cnt,
    List<WeatherData>? list,
    City? city,
    bool? isCurrentLocation,
  }) {
    return WeatherResponse(
      cod: cod ?? this.cod,
      message: message ?? this.message,
      cnt: cnt ?? this.cnt,
      list: list ?? this.list,
      city: city ?? this.city,
      isCurrentLocation: isCurrentLocation ?? this.isCurrentLocation,
    );
  }

  @override
  List<Object?> get props => [cod, message, cnt, list, city, isCurrentLocation];
}

@HiveType(typeId: 1)
class WeatherData extends Equatable {
  @HiveField(0)
  final int? dt;

  @HiveField(1)
  final Main? main;

  @HiveField(2)
  final List<Weather>? weather;

  @HiveField(3)
  final Clouds? clouds;

  @HiveField(4)
  final Wind? wind;

  @HiveField(5)
  final int? visibility;

  @HiveField(6)
  final double? pop;

  @HiveField(7)
  final Rain? rain;

  @HiveField(8)
  final Sys? sys;

  @HiveField(9)
  final String? dtTxt;

  const WeatherData({
    this.dt,
    this.main,
    this.weather,
    this.clouds,
    this.wind,
    this.visibility,
    this.pop,
    this.rain,
    this.sys,
    this.dtTxt,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      dt: json['dt'] as int?,
      main: json['main'] != null ? Main.fromJson(json['main'] as Map<String, dynamic>) : null,
      weather: (json['weather'] as List<dynamic>?)
          ?.map((item) => Weather.fromJson(item as Map<String, dynamic>))
          .toList(),
      clouds: json['clouds'] != null ? Clouds.fromJson(json['clouds'] as Map<String, dynamic>) : null,
      wind: json['wind'] != null ? Wind.fromJson(json['wind'] as Map<String, dynamic>) : null,
      visibility: json['visibility'] as int?,
      pop: (json['pop'] as num?)?.toDouble(),
      rain: json['rain'] != null ? Rain.fromJson(json['rain'] as Map<String, dynamic>) : null,
      sys: json['sys'] != null ? Sys.fromJson(json['sys'] as Map<String, dynamic>) : null,
      dtTxt: json['dt_txt'] as String?,
    );
  }

  @override
  List<Object?> get props => [dt, main, weather, clouds, wind, visibility, pop, rain, sys, dtTxt];
}

@HiveType(typeId: 2)
class Main extends Equatable {
  @HiveField(0)
  final double? temp;

  @HiveField(1)
  final double? feelsLike;

  @HiveField(2)
  final double? tempMin;

  @HiveField(3)
  final double? tempMax;

  @HiveField(4)
  final int? pressure;

  @HiveField(5)
  final int? seaLevel;

  @HiveField(6)
  final int? grndLevel;

  @HiveField(7)
  final int? humidity;

  @HiveField(8)
  final double? tempKf;

  const Main({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.seaLevel,
    this.grndLevel,
    this.humidity,
    this.tempKf,
  });

  factory Main.fromJson(Map<String, dynamic> json) {
    return Main(
      temp: (json['temp'] as num?)?.toDouble(),
      feelsLike: (json['feels_like'] as num?)?.toDouble(),
      tempMin: (json['temp_min'] as num?)?.toDouble(),
      tempMax: (json['temp_max'] as num?)?.toDouble(),
      pressure: json['pressure'] as int?,
      seaLevel: json['sea_level'] as int?,
      grndLevel: json['grnd_level'] as int?,
      humidity: json['humidity'] as int?,
      tempKf: (json['temp_kf'] as num?)?.toDouble(),
    );
  }

  @override
  List<Object?> get props => [temp, feelsLike, tempMin, tempMax, pressure, seaLevel, grndLevel, humidity, tempKf];
}

@HiveType(typeId: 3)
class Weather extends Equatable {
  @HiveField(0)
  final int? id;

  @HiveField(1)
  final String? main;

  @HiveField(2)
  final String? description;

  @HiveField(3)
  final String? icon;

  const Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      id: json['id'] as int?,
      main: json['main'] as String?,
      description: json['description'] as String?,
      icon: json['icon'] as String?,
    );
  }

  @override
  List<Object?> get props => [id, main, description, icon];
}

@HiveType(typeId: 4)
class Clouds extends Equatable {
  @HiveField(0)
  final int? all;

  const Clouds({this.all});

  factory Clouds.fromJson(Map<String, dynamic> json) {
    return Clouds(
      all: json['all'] as int?,
    );
  }

  @override
  List<Object?> get props => [all];
}

@HiveType(typeId: 5)
class Wind extends Equatable {
  @HiveField(0)
  final double? speed;

  @HiveField(1)
  final int? deg;

  @HiveField(2)
  final double? gust;

  const Wind({
    this.speed,
    this.deg,
    this.gust,
  });

  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(
      speed: (json['speed'] as num?)?.toDouble(),
      deg: json['deg'] as int?,
      gust: (json['gust'] as num?)?.toDouble(),
    );
  }

  @override
  List<Object?> get props => [speed, deg, gust];
}

@HiveType(typeId: 6)
class Rain extends Equatable {
  @HiveField(0)
  final double? threeH;

  const Rain({this.threeH});

  factory Rain.fromJson(Map<String, dynamic> json) {
    return Rain(
      threeH: (json['3h'] as num?)?.toDouble(),
    );
  }

  @override
  List<Object?> get props => [threeH];
}

@HiveType(typeId: 7)
class Sys extends Equatable {
  @HiveField(0)
  final String? pod;

  const Sys({this.pod});

  factory Sys.fromJson(Map<String, dynamic> json) {
    return Sys(
      pod: json['pod'] as String?,
    );
  }

  @override
  List<Object?> get props => [pod];
}

@HiveType(typeId: 8)
class City extends Equatable {
  @HiveField(0)
  final int? id;

  @HiveField(1)
  final String? name;

  @HiveField(2)
  final Coord? coord;

  @HiveField(3)
  final String? country;

  @HiveField(4)
  final int? population;

  @HiveField(5)
  final int? timezone;

  @HiveField(6)
  final int? sunrise;

  @HiveField(7)
  final int? sunset;

  const City({
    this.id,
    this.name,
    this.coord,
    this.country,
    this.population,
    this.timezone,
    this.sunrise,
    this.sunset,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['id'] as int?,
      name: json['name'] as String?,
      coord: json['coord'] != null ? Coord.fromJson(json['coord'] as Map<String, dynamic>) : null,
      country: json['country'] as String?,
      population: json['population'] as int?,
      timezone: json['timezone'] as int?,
      sunrise: json['sunrise'] as int?,
      sunset: json['sunset'] as int?,
    );
  }

  @override
  List<Object?> get props => [id, name, coord, country, population, timezone, sunrise, sunset];
}

@HiveType(typeId: 9)
class Coord extends Equatable {
  @HiveField(0)
  final double? lat;

  @HiveField(1)
  final double? lon;

  const Coord({
    this.lat,
    this.lon,
  });

  factory Coord.fromJson(Map json) {
    return Coord(
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
    );
  }

  @override
  List<Object?> get props => [lat, lon];
}
