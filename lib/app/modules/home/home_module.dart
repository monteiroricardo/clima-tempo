import 'package:clima_e_tempo/app/application/modules/module.dart';
import 'package:clima_e_tempo/app/modules/home/home_bindings.dart';
import 'package:clima_e_tempo/app/modules/home/home_view.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class HomeModule extends Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/',
      page: () => const HomeView(),
      binding: HomeBindings(),
    ),
  ];
}
