import 'package:go_router/go_router.dart';
import 'package:travel_test/features/home/pages/add_plan_page.dart';

import '../../features/home/pages/add_arrival_page.dart';
import '../../features/home/pages/add_departure_page.dart';
import '../../features/home/pages/add_transfer_page.dart';
import '../../features/home/pages/edit_flight_page.dart';
import '../../features/home/pages/edit_transfer_page.dart';
import '../../features/home/pages/flight_detail_page.dart';
import '../../features/home/pages/home_page.dart';
import '../../features/home/pages/jetlag_page.dart';
import '../../features/home/pages/settings_page.dart';
import '../../features/home/pages/onboard_page.dart';
import '../../features/home/pages/splash_page.dart';
import '../../features/home/pages/statistics_page.dart';
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
    GoRoute(
      path: '/edit-transfer',
      builder: (context, state) => EditTransferPage(
        flight: state.extra as Flight,
      ),
    ),
    GoRoute(
      path: '/add-plan',
      builder: (context, state) => AddPlanPage(
        flight: state.extra as Flight,
      ),
    ),
    GoRoute(
      path: '/edit-flight',
      builder: (context, state) => EditFlightPage(
        flight: state.extra as Flight,
      ),
    ),
    GoRoute(
      path: '/flight-detail',
      builder: (context, state) => FlightDetailPage(
        flight: state.extra as Flight,
      ),
    ),
    GoRoute(
      path: '/jetlag',
      builder: (context, state) => const JetlagPage(),
    ),
    GoRoute(
      path: '/statistics',
      builder: (context, state) => const StatisticsPage(),
    ),
  ],
);
