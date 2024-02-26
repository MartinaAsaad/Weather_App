import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cupits/getweathercupit/get_weather_cubit.dart';
import 'package:weather_app/cupits/getweathercupit/get_weather_states.dart';
import 'package:weather_app/models/weathermodel.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        // backgroundColor: Colors.blue,
        // foregroundColor: Colors.white,
        // surfaceTintColor: Colors.black,
        // shadowColor: Color.fromARGB(255, 44, 92, 164),
        // elevation: 3,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return SearchView();
                    },
                  ),
                );
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            if(state is weatherInitialState){
              return NoWeatherBody();
            }else if(state is WeatherLoadedState){
              return WeatherInfoBody();
            }else{
              return Text('opps! there was an error');            }

          }),
    );
  }
}
