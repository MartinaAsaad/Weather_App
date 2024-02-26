import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cupits/getweathercupit/get_weather_cubit.dart';
import 'package:weather_app/cupits/getweathercupit/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(builder: (context) {
        return BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                appBarTheme: AppBarTheme(
                  color: getappbarColor(
                      BlocProvider.of<GetWeatherCubit>(context)
                          .weatherModel
                          ?.weatherstate),
                  foregroundColor: Colors.white,
                  shadowColor: Colors.black,
                  elevation: 5,
                  titleTextStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                primaryColor: Colors.red,
              ),
              home: HomeView(),
            );
          },
        );
      }),
    );
  }
}

class custommaterialapp extends StatelessWidget {
  const custommaterialapp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: getappbarColor(BlocProvider.of<GetWeatherCubit>(context)
              .weatherModel
              ?.weatherstate),
          foregroundColor: Colors.white,
          shadowColor: Colors.black,
          elevation: 5,
          titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        primaryColor: Colors.red,
      ),
      home: HomeView(),
    );
  }
}

MaterialColor getappbarColor(String? weatherState) {
  if (weatherState == null) {
    return Colors.blue;
  }

  switch (weatherState) {
    case 'Sunny':
    case 'Clear':
      return Colors.yellow;
    case 'Partly Cloudy ':
    case 'Cloudy':
    case 'Overcast ':
    case 'Mist':
      return Colors.grey;

    case 'Patchy rain possible ':
    case 'Patchy snow possible ':
    case 'Patchy sleet possible ':
    case 'Patchy freezing drizzle possible ':
    case 'Patchy rain nearby':
      return Colors.blueGrey;
    case 'Thundery outbreaks possible ':
      return Colors.orange;
    case 'Blowing snow ':
    case 'Blizzard':
    case 'Fog':
    case 'Freezing fog ':
      return Colors.grey;
    default:
      log('"$weatherState"');
      return Colors.blue;
  }
}
