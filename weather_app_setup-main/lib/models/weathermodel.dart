class WeatherModel {
  final double currenttemp;
  final String cityname;
  final DateTime updatedate;
  final String? image;
  final double mintemp;
  final double maxtemp;
  final String weatherstate;

  WeatherModel(
      {required this.currenttemp,
      required this.cityname,
      required this.updatedate,
      required this.image,
      required this.mintemp,
      required this.maxtemp,
      required this.weatherstate});

  factory WeatherModel.fromjson(json) {
    return WeatherModel(
        currenttemp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
        cityname: json['location']['name'],
        updatedate:DateTime.parse(json['current']['last_updated']) ,
        image: json['current']['condition']['icon'],
        mintemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
        maxtemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        weatherstate: json['forecast']['forecastday'][0]['day']['condition']
            ['text']);
  }
}
