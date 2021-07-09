import 'package:get/get.dart';

import 'package:ridethebee/app/modules/boarding/bindings/boarding_binding.dart';
import 'package:ridethebee/app/modules/boarding/views/boarding_view.dart';
import 'package:ridethebee/app/modules/car_seats/bindings/car_seats_binding.dart';
import 'package:ridethebee/app/modules/car_seats/views/car_seats_view.dart';
import 'package:ridethebee/app/modules/home/bindings/home_binding.dart';
import 'package:ridethebee/app/modules/home/views/home_view.dart';
import 'package:ridethebee/app/modules/login/bindings/login_binding.dart';
import 'package:ridethebee/app/modules/login/views/login_view.dart';
import 'package:ridethebee/app/modules/menus/bindings/menus_binding.dart';
import 'package:ridethebee/app/modules/menus/views/menus_view.dart';
import 'package:ridethebee/app/modules/notification/bindings/notification_binding.dart';
import 'package:ridethebee/app/modules/notification/views/notification_view.dart';
import 'package:ridethebee/app/modules/register/bindings/register_binding.dart';
import 'package:ridethebee/app/modules/register/views/register_view.dart';
import 'package:ridethebee/app/modules/splash_screen/bindings/splash_screen_binding.dart';
import 'package:ridethebee/app/modules/splash_screen/views/splash_screen_view.dart';
import 'package:ridethebee/app/modules/ticket_details/bindings/ticket_details_binding.dart';
import 'package:ridethebee/app/modules/ticket_details/views/ticket_details_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.BOARDING,
      page: () => BoardingView(),
      binding: BoardingBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.MENUS,
      page: () => MenusView(),
      binding: MenusBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.TICKET_DETAILS,
      page: () => TicketDetailsView(),
      binding: TicketDetailsBinding(),
    ),
    GetPage(
      name: _Paths.CAR_SEATS,
      page: () => CarSeatsView(),
      binding: CarSeatsBinding(),
    ),
  ];
}
