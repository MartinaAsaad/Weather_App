import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cupits/getweathercupit/get_weather_cubit.dart';
import 'package:weather_app/models/weathermodel.dart';
import 'package:weather_app/services/weatherservice.dart';
import 'package:weather_app/views/home_view.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a city'),
        // backgroundColor: Colors.blue,
        // foregroundColor: Colors.white,
        // surfaceTintColor: Colors.black,
        // shadowColor: Color.fromARGB(255, 44, 92, 164),
        // elevation: 3,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
              var getwathercubit = BlocProvider.of<GetWeatherCubit>(context);
              getwathercubit.getWeather(cityname: value);
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 32, horizontal: 10),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue)),
              suffixIcon: Icon(Icons.search),
              hintText: 'enter city name',
              labelText: 'search',
            ),
          ),
        ),
      ),
    );
  }
}
