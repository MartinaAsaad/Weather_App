import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cupits/getweathercupit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var weathermodel = BlocProvider.of<GetWeatherCubit>(context).weatherModel!;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          getappbarColor(weathermodel.weatherstate),
        Color.fromARGB(255, 0, 92, 168),
       //   Color.fromARGB(255, 0, 0, 0),
        ], begin: Alignment.topCenter,end: Alignment.bottomCenter,),

      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weathermodel.cityname,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            Text(
              'updated at ${weathermodel.updatedate.hour}:${weathermodel.updatedate.minute}',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  'https:${weathermodel.image!}',scale: 0.5,
                ),
                Text(
                  weathermodel.currenttemp.round().toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'Maxtemp: ${weathermodel.maxtemp.round()}',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Mintemp: ${weathermodel.mintemp.round()}',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              weathermodel.weatherstate,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
