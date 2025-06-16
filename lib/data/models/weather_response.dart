import 'package:equatable/equatable.dart';

class WeatherResponse extends Equatable {
  final String? cod;
  final int? message;
  final int? cnt;
  final List<WeatherData>? list;
  final City? city;

  const WeatherResponse({
    this.cod,
    this.message,
    this.cnt,
    this.list,
    this.city,
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

  @override
  List<Object?> get props => [cod, message, cnt, list, city];
}

class WeatherData extends Equatable {
  final int? dt;
  final Main? main;
  final List<Weather>? weather;
  final Clouds? clouds;
  final Wind? wind;
  final int? visibility;
  final double? pop;
  final Rain? rain;
  final Sys? sys;
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

class Main extends Equatable {
  final double? temp;
  final double? feelsLike;
  final double? tempMin;
  final double? tempMax;
  final int? pressure;
  final int? seaLevel;
  final int? grndLevel;
  final int? humidity;
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

class Weather extends Equatable {
  final int? id;
  final String? main;
  final String? description;
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

class Clouds extends Equatable {
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

class Wind extends Equatable {
  final double? speed;
  final int? deg;
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

class Rain extends Equatable {
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

class Sys extends Equatable {
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

class City extends Equatable {
  final int? id;
  final String? name;
  final Coord? coord;
  final String? country;
  final int? population;
  final int? timezone;
  final int? sunrise;
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

class Coord extends Equatable {
  final double? lat;
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
