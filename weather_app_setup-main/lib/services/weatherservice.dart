import 'package:dio/dio.dart';
import 'package:weather_app/models/weathermodel.dart';

class weatherService {
  final Dio dio;
  final String apikey = '743b72b822ec4cf99f9161235242901';
  final String baseurl = 'https://api.weatherapi.com/v1';
  weatherService(this.dio);
  Future<WeatherModel> getCurrentWeather({required String city}) async {
    try {
      Response response =
          await dio.get('$baseurl/forecast.json?key=$apikey&q=$city&days=1');

      WeatherModel currentweather = WeatherModel.fromjson(response.data);
      return currentweather;
    } on DioException catch (e) {
      // TODO
      final String errormsg=e.response?.data['error']['message'] ?? 'Opps ,there was an error ,tru later';
      throw Exception(errormsg);
    }catch(e){
      throw Exception('Opps ,there was an error ,tru later');
    }
  }
}
