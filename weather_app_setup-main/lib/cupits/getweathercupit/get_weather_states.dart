import 'package:weather_app/models/weathermodel.dart';

class WeatherState{}

class weatherInitialState extends WeatherState{}


class WeatherLoadedState extends WeatherState{
final WeatherModel weatherModel;

  WeatherLoadedState({required this.weatherModel});


}

class WeatherFaliureState extends WeatherState{}