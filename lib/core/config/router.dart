import 'package:go_router/go_router.dart';

import '../../features/home/pages/add_arrival_page.dart';
import '../../features/home/pages/add_departure_page.dart';
import '../../features/home/pages/add_transfer_page.dart';
import '../../features/home/pages/home_page.dart';
import '../../features/home/pages/settings_page.dart';
import '../../features/home/pages/onboard_page.dart';
import '../../features/home/pages/splash_page.dart';
import '../models/flight.dart';

final routerConfig = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/onboard',
      builder: (context, state) => const OnboardPage(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsPage(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/add-departure',
      builder: (context, state) => const AddDeparturePage(),
    ),
    GoRoute(
      path: '/add-arrival',
      builder: (context, state) => AddArrivalPage(
        flight: state.extra as Flight,
      ),
    ),
    GoRoute(
      path: '/add-transfer',
      builder: (context, state) => AddTransferPage(
        flight: state.extra as Flight,
      ),
    ),
  ],
);
