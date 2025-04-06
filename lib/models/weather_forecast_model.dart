import 'package:untitled1/utils/time_utils.dart';

const int limitDayRepresent = 4;

class WeatherForecast {
  String cod;
  int message;
  int cnt;
  List<ForecastItem> list;
  City city;
  Map<String, List<double>> dailyTemp = {};

  WeatherForecast({
    required this.cod,
    required this.message,
    required this.cnt,
    required this.list,
    required this.city,
    required this.dailyTemp
  });

  factory WeatherForecast.defaultInstance() {
    return WeatherForecast(
      cod: "200",
      message: 0,
      cnt: 0,
      list: [],
      dailyTemp: {},
      city: City(
        id: 0,
        name: "Unknown",
        coord: Coord(lat: 0.0, lon: 0.0),
        country: "N/A",
        population: 0,
        timezone: 0,
        sunrise: 0,
        sunset: 0,
      ),
    );
  }

  factory WeatherForecast.fromJson(Map<String, dynamic> json) {
    return WeatherForecast(
      dailyTemp: {},
      cod: json['cod'],
      message: json['message'],
      cnt: json['cnt'],
      list: List<ForecastItem>.from(json['list'].map((x) => ForecastItem.fromJson(x))),
      city: City.fromJson(json['city']),
    );
  }

  factory WeatherForecast.fromJson5days(Map<String, dynamic> json, String representativeHour) {
    List<ForecastItem> list = List.empty(growable: true);
    Map<String, List<double>> dailyTemps = {};
    for (var item in json['list']) {
      if (list.length == limitDayRepresent) break;
      if (item['dt_txt'] == null) continue;
      String dayDtString = item['dt_txt'].toString().split(" ").first;
      DateTime dayDt = DateTime.parse(dayDtString);
      if (TimeUtils.isToday(dayDt)) continue;
      if (!dailyTemps.containsKey(dayDtString)) {
        dailyTemps[dayDtString] = [];
      }
      dailyTemps[dayDtString]!.add(item['main']['temp']);
      if (item['dt_txt'].toString().contains(representativeHour)) {
        list.add(ForecastItem.fromJson(item, dayDt: dayDt, dailyKey: dayDtString));
      }
    }
    return WeatherForecast(
      cod: json['cod'],
      message: json['message'],
      cnt: json['cnt'],
      list: list,
      dailyTemp: dailyTemps,
      city: City.fromJson(json['city']),
    );
  }
}

class ForecastItem {
  final int? dt;
  final MainWeather? main;
  final List<Weather>? weather;
  final Clouds? clouds;
  final Wind? wind;
  final int? visibility;
  final double? pop;
  final Rain? rain;
  final Sys? sys;
  final String? dtTxt;
  final DateTime? day;
  final String? dailyKey;

  ForecastItem({
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
    this.day,
    this.dailyKey
  });

  factory ForecastItem.fromJson(Map<String, dynamic> json, {DateTime? dayDt, String? dailyKey}) {
    return ForecastItem(
      dt: json['dt'],
      main: MainWeather.fromJson(json['main']),
      weather: List<Weather>.from(json['weather'].map((x) => Weather.fromJson(x))),
      clouds: Clouds.fromJson(json['clouds']),
      wind: Wind.fromJson(json['wind']),
      visibility: json['visibility'],
      pop: (json['pop'] as num).toDouble(),
      rain: json['rain'] != null ? Rain.fromJson(json['rain']) : null,
      sys: Sys.fromJson(json['sys']),
      dtTxt: json['dt_txt'],
      day: dayDt,
      dailyKey: dailyKey,
    );
  }

  String getWeekDayByDate() {
    if (day == null) return "";
    return TimeUtils.getWeekday(day!);
  }

  String getDisplayTemp(List<double> dailyTemp) {
    double avgTemp = dailyTemp.reduce((a, b) => a + b) / dailyTemp.length;
    return "${avgTemp.round()}C";
  }
}

class MainWeather {
  final double? temp;
  final double? feelsLike;
  final double? tempMin;
  final double? tempMax;
  final int? pressure;
  final int? seaLevel;
  final int? grndLevel;
  final int? humidity;
  final double? tempKf;

  MainWeather({
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

  factory MainWeather.fromJson(Map<String, dynamic> json) {
    return MainWeather(
      temp: (json['temp'] as num).toDouble(),
      feelsLike: (json['feels_like'] as num).toDouble(),
      tempMin: (json['temp_min'] as num).toDouble(),
      tempMax: (json['temp_max'] as num).toDouble(),
      pressure: json['pressure'],
      seaLevel: json['sea_level'],
      grndLevel: json['grnd_level'],
      humidity: json['humidity'],
      tempKf: (json['temp_kf'] as num).toDouble(),
    );
  }
}

class Weather {
  final int id;
  final String main;
  final String description;
  final String icon;

  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      id: json['id'],
      main: json['main'],
      description: json['description'],
      icon: json['icon'],
    );
  }
}

class Clouds {
  final int all;

  Clouds({required this.all});

  factory Clouds.fromJson(Map<String, dynamic> json) {
    return Clouds(all: json['all']);
  }
}

class Wind {
  final double speed;
  final int deg;
  final double gust;

  Wind({
    required this.speed,
    required this.deg,
    required this.gust,
  });

  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(
      speed: (json['speed'] as num).toDouble(),
      deg: json['deg'],
      gust: (json['gust'] as num).toDouble(),
    );
  }
}

class Rain {
  final double threeH;

  Rain({required this.threeH});

  factory Rain.fromJson(Map<String, dynamic> json) {
    return Rain(threeH: (json['3h'] as num).toDouble());
  }
}

class Sys {
  final String pod;

  Sys({required this.pod});

  factory Sys.fromJson(Map<String, dynamic> json) {
    return Sys(pod: json['pod']);
  }
}

class City {
  final int id;
  final String name;
  final Coord coord;
  final String country;
  final int population;
  final int timezone;
  final int sunrise;
  final int sunset;

  City({
    required this.id,
    required this.name,
    required this.coord,
    required this.country,
    required this.population,
    required this.timezone,
    required this.sunrise,
    required this.sunset,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['id'],
      name: json['name'],
      coord: Coord.fromJson(json['coord']),
      country: json['country'],
      population: json['population'],
      timezone: json['timezone'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
    );
  }
}

class Coord {
  final double lat;
  final double lon;

  Coord({required this.lat, required this.lon});

  factory Coord.fromJson(Map<String, dynamic> json) {
    return Coord(
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
    );
  }
}
