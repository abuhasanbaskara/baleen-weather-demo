import 'package:baleen_weather_app_test/view/home_page.dart';
import 'package:baleen_weather_app_test/view/setting_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomePage(),
      routes: [
        GoRoute(
          path: 'setting',
          builder: (context, state) => const SettingPage(),
        ),
      ],
    ),
  ],
);