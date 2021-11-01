import 'package:clima_e_tempo/app/models/climate_model.dart';
import 'package:clima_e_tempo/app/services/api_service.dart';
import 'package:clima_e_tempo/app/ui/loader/loader_mixin.dart';
import 'package:clima_e_tempo/app/ui/messages/messages_mixin.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with LoaderMixin, MessagesMixin {
  final _apiService = ApiService();
  final _currentClimate = Rxn<ClimateModel>();
  final loading = false.obs;
  final message = Rxn<MessageModel>();

  @override
  void onInit() async {
    super.onInit();
    loaderListener(loading);
    messageListener(message);
    await 1.delay();
    getClimateForCityName('São Paulo');
  }

  TextEditingController searchController = TextEditingController();

  void clearSearchController() => searchController.clear();

  bool get currentClimateIsNull => _currentClimate.value == null;

  ClimateModel get currentClimate => _currentClimate.value!;

  Future<void> getClimateForCityName(String city) async {
    try {
      loading(true);
      _currentClimate.value = await _apiService.getClimateForCityName(city);
      loading(false);
      message(
        MessageModel.info(
            title: 'Sucesso', message: 'Clima resgatado com sucesso'),
      );
    } catch (e) {
      print(e);
      loading(false);

      message(
        MessageModel.error(
            title: 'Erro', message: 'Houve um erro ao resgatar clima'),
      );
    }
  }
}
