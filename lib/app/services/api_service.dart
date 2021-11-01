import 'package:clima_e_tempo/app/models/climate_model.dart';
import 'package:clima_e_tempo/app/repositories/api_repository.dart';

class ApiService {
  final _apiRepository = ApiRepository();

  Future<ClimateModel> getClimateForCityName(String city) =>
      _apiRepository.getClimateForCityName(city);
}
