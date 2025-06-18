// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeatherResponseAdapter extends TypeAdapter<WeatherResponse> {
  @override
  final int typeId = 0;

  @override
  WeatherResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeatherResponse(
      cod: fields[0] as String?,
      message: fields[1] as int?,
      cnt: fields[2] as int?,
      list: (fields[3] as List?)?.cast<WeatherData>(),
      city: fields[4] as City?,
      isCurrentLocation: fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, WeatherResponse obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.cod)
      ..writeByte(1)
      ..write(obj.message)
      ..writeByte(2)
      ..write(obj.cnt)
      ..writeByte(3)
      ..write(obj.list)
      ..writeByte(4)
      ..write(obj.city)
      ..writeByte(5)
      ..write(obj.isCurrentLocation);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class WeatherDataAdapter extends TypeAdapter<WeatherData> {
  @override
  final int typeId = 1;

  @override
  WeatherData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeatherData(
      dt: fields[0] as int?,
      main: fields[1] as Main?,
      weather: (fields[2] as List?)?.cast<Weather>(),
      clouds: fields[3] as Clouds?,
      wind: fields[4] as Wind?,
      visibility: fields[5] as int?,
      pop: fields[6] as double?,
      rain: fields[7] as Rain?,
      sys: fields[8] as Sys?,
      dtTxt: fields[9] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, WeatherData obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.dt)
      ..writeByte(1)
      ..write(obj.main)
      ..writeByte(2)
      ..write(obj.weather)
      ..writeByte(3)
      ..write(obj.clouds)
      ..writeByte(4)
      ..write(obj.wind)
      ..writeByte(5)
      ..write(obj.visibility)
      ..writeByte(6)
      ..write(obj.pop)
      ..writeByte(7)
      ..write(obj.rain)
      ..writeByte(8)
      ..write(obj.sys)
      ..writeByte(9)
      ..write(obj.dtTxt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MainAdapter extends TypeAdapter<Main> {
  @override
  final int typeId = 2;

  @override
  Main read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Main(
      temp: fields[0] as double?,
      feelsLike: fields[1] as double?,
      tempMin: fields[2] as double?,
      tempMax: fields[3] as double?,
      pressure: fields[4] as int?,
      seaLevel: fields[5] as int?,
      grndLevel: fields[6] as int?,
      humidity: fields[7] as int?,
      tempKf: fields[8] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, Main obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.temp)
      ..writeByte(1)
      ..write(obj.feelsLike)
      ..writeByte(2)
      ..write(obj.tempMin)
      ..writeByte(3)
      ..write(obj.tempMax)
      ..writeByte(4)
      ..write(obj.pressure)
      ..writeByte(5)
      ..write(obj.seaLevel)
      ..writeByte(6)
      ..write(obj.grndLevel)
      ..writeByte(7)
      ..write(obj.humidity)
      ..writeByte(8)
      ..write(obj.tempKf);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MainAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class WeatherAdapter extends TypeAdapter<Weather> {
  @override
  final int typeId = 3;

  @override
  Weather read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Weather(
      id: fields[0] as int?,
      main: fields[1] as String?,
      description: fields[2] as String?,
      icon: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Weather obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.main)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.icon);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CloudsAdapter extends TypeAdapter<Clouds> {
  @override
  final int typeId = 4;

  @override
  Clouds read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Clouds(
      all: fields[0] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Clouds obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.all);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CloudsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class WindAdapter extends TypeAdapter<Wind> {
  @override
  final int typeId = 5;

  @override
  Wind read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Wind(
      speed: fields[0] as double?,
      deg: fields[1] as int?,
      gust: fields[2] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, Wind obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.speed)
      ..writeByte(1)
      ..write(obj.deg)
      ..writeByte(2)
      ..write(obj.gust);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WindAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RainAdapter extends TypeAdapter<Rain> {
  @override
  final int typeId = 6;

  @override
  Rain read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Rain(
      threeH: fields[0] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, Rain obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.threeH);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RainAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SysAdapter extends TypeAdapter<Sys> {
  @override
  final int typeId = 7;

  @override
  Sys read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Sys(
      pod: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Sys obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.pod);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SysAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CityAdapter extends TypeAdapter<City> {
  @override
  final int typeId = 8;

  @override
  City read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return City(
      id: fields[0] as int?,
      name: fields[1] as String?,
      coord: fields[2] as Coord?,
      country: fields[3] as String?,
      population: fields[4] as int?,
      timezone: fields[5] as int?,
      sunrise: fields[6] as int?,
      sunset: fields[7] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, City obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.coord)
      ..writeByte(3)
      ..write(obj.country)
      ..writeByte(4)
      ..write(obj.population)
      ..writeByte(5)
      ..write(obj.timezone)
      ..writeByte(6)
      ..write(obj.sunrise)
      ..writeByte(7)
      ..write(obj.sunset);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CoordAdapter extends TypeAdapter<Coord> {
  @override
  final int typeId = 9;

  @override
  Coord read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Coord(
      lat: fields[0] as double?,
      lon: fields[1] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, Coord obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.lat)
      ..writeByte(1)
      ..write(obj.lon);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoordAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
