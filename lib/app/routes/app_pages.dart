import 'package:get/get.dart';

import 'package:ridethebee/app/modules/boarding/bindings/boarding_binding.dart';
import 'package:ridethebee/app/modules/boarding/views/boarding_view.dart';
import 'package:ridethebee/app/modules/car_seats/bindings/car_seats_binding.dart';
import 'package:ridethebee/app/modules/car_seats/views/car_seats_view.dart';
import 'package:ridethebee/app/modules/cashback_wallet/bindings/cashback_wallet_binding.dart';
import 'package:ridethebee/app/modules/cashback_wallet/views/cashback_wallet_view.dart';
import 'package:ridethebee/app/modules/edit_profile/bindings/edit_profile_binding.dart';
import 'package:ridethebee/app/modules/edit_profile/views/edit_profile_view.dart';
import 'package:ridethebee/app/modules/en_route/bindings/en_route_binding.dart';
import 'package:ridethebee/app/modules/en_route/views/en_route_view.dart';
import 'package:ridethebee/app/modules/home/bindings/home_binding.dart';
import 'package:ridethebee/app/modules/home/views/home_view.dart';
import 'package:ridethebee/app/modules/login/bindings/login_binding.dart';
import 'package:ridethebee/app/modules/login/views/login_view.dart';
import 'package:ridethebee/app/modules/menus/bindings/menus_binding.dart';
import 'package:ridethebee/app/modules/menus/views/menus_view.dart';
import 'package:ridethebee/app/modules/messages/bindings/messages_binding.dart';
import 'package:ridethebee/app/modules/messages/views/messages_view.dart';
import 'package:ridethebee/app/modules/my_tickets/bindings/my_tickets_binding.dart';
import 'package:ridethebee/app/modules/my_tickets/views/my_tickets_view.dart';
import 'package:ridethebee/app/modules/notification/bindings/notification_binding.dart';
import 'package:ridethebee/app/modules/notification/views/notification_view.dart';
import 'package:ridethebee/app/modules/payment_details/bindings/payment_details_binding.dart';
import 'package:ridethebee/app/modules/payment_details/views/payment_details_view.dart';
import 'package:ridethebee/app/modules/payment_successfull/bindings/payment_successfull_binding.dart';
import 'package:ridethebee/app/modules/payment_successfull/views/payment_successfull_view.dart';
import 'package:ridethebee/app/modules/pit_stop/bindings/pit_stop_binding.dart';
import 'package:ridethebee/app/modules/pit_stop/views/pit_stop_view.dart';
import 'package:ridethebee/app/modules/profile/bindings/profile_binding.dart';
import 'package:ridethebee/app/modules/profile/views/profile_view.dart';
import 'package:ridethebee/app/modules/register/bindings/register_binding.dart';
import 'package:ridethebee/app/modules/register/views/register_view.dart';
import 'package:ridethebee/app/modules/review/bindings/review_binding.dart';
import 'package:ridethebee/app/modules/review/views/review_view.dart';
import 'package:ridethebee/app/modules/splash_screen/bindings/splash_screen_binding.dart';
import 'package:ridethebee/app/modules/splash_screen/views/splash_screen_view.dart';
import 'package:ridethebee/app/modules/thank_you/bindings/thank_you_binding.dart';
import 'package:ridethebee/app/modules/thank_you/views/thank_you_view.dart';
import 'package:ridethebee/app/modules/ticket_details/bindings/ticket_details_binding.dart';
import 'package:ridethebee/app/modules/ticket_details/views/ticket_details_view.dart';
import 'package:ridethebee/app/modules/trip_completed/bindings/trip_completed_binding.dart';
import 'package:ridethebee/app/modules/trip_completed/views/trip_completed_view.dart';

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
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => EditProfileView(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: _Paths.CASHBACK_WALLET,
      page: () => CashbackWalletView(),
      binding: CashbackWalletBinding(),
    ),
    GetPage(
      name: _Paths.MY_TICKETS,
      page: () => MyTicketsView(),
      binding: MyTicketsBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT_DETAILS,
      page: () => PaymentDetailsView(),
      binding: PaymentDetailsBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT_SUCCESSFULL,
      page: () => PaymentSuccessfullView(),
      binding: PaymentSuccessfullBinding(),
    ),
    GetPage(
      name: _Paths.THANK_YOU,
      page: () => ThankYouView(),
      binding: ThankYouBinding(),
    ),
    GetPage(
      name: _Paths.TRIP_COMPLETED,
      page: () => TripCompletedView(),
      binding: TripCompletedBinding(),
    ),
    GetPage(
      name: _Paths.REVIEW,
      page: () => ReviewView(),
      binding: ReviewBinding(),
    ),
    GetPage(
      name: _Paths.EN_ROUTE,
      page: () => EnRouteView(),
      binding: EnRouteBinding(),
    ),
    GetPage(
      name: _Paths.PIT_STOP,
      page: () => PitStopView(),
      binding: PitStopBinding(),
    ),
    GetPage(
      name: _Paths.MESSAGES,
      page: () => MessagesView(),
      binding: MessagesBinding(),
    ),
  ];
}
