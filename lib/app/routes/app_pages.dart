import 'package:get/get.dart';

import '../modules/alquran/bindings/alquran_binding.dart';
import '../modules/alquran/views/alquran_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/rotib/bindings/rotib_binding.dart';
import '../modules/rotib/views/rotib_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ALQURAN,
      page: () => const AlquranView(),
      binding: AlquranBinding(),
    ),
    GetPage(
      name: _Paths.ROTIB,
      page: () => RotibView(),
      binding: RotibBinding(),
    ),
  ];
}
