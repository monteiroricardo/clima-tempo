import 'package:clima_e_tempo/app/models/climate_model.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

class ApiRepository {
  GetConnect getConnect = GetConnect();

  static const String _baseUrl =
      'https://api.openweathermap.org/data/2.5/weather';

  Future<ClimateModel> getClimateForCityName(
    String city,
  ) async {
    Response response = await getConnect.get(
      _baseUrl,
      query: <String, String>{
        'q': city,
        'appid': dotenv.env['API_KEY']!,
        'units': 'metric',
        'lang': 'pt_br',
      },
    );

    return ClimateModel.fromMap(response.body);
  }
}
