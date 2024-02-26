import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cupits/getweathercupit/get_weather_states.dart';
import 'package:weather_app/models/weathermodel.dart';
import 'package:weather_app/services/weatherservice.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(weatherInitialState());
   WeatherModel? weatherModel;
  getWeather({required String cityname}) async {
    try {
     weatherModel =
          await weatherService(Dio()).getCurrentWeather(city: cityname);
      emit(WeatherLoadedState(weatherModel: weatherModel!));
    } catch (e) {
      // TODO
      emit(WeatherFaliureState());
    }
  }
}
