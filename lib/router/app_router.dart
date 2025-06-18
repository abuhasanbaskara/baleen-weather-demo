import 'package:baleen_weather_app_test/logic/blocs/home/home_bloc.dart';
import 'package:baleen_weather_app_test/logic/blocs/home/home_event.dart';
import 'package:baleen_weather_app_test/view/home_page.dart';
import 'package:baleen_weather_app_test/view/setting_page.dart';
import 'package:baleen_weather_app_test/di.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return BlocProvider<HomeBloc>(
          create: (context) => getIt<HomeBloc>()
            ..add(FirstCheck())
            ..add(CallSavedWeather()),
          child: HomePage(),
        );
      },
      routes: [
        GoRoute(
          path: 'setting',
          builder: (context, state) => const SettingPage(),
        ),
      ],
    ),
  ],
);
