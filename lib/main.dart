import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:baleen_weather_app_test/l10n/app_localizations.dart';
import 'package:baleen_weather_app_test/logic/blocs/setting/setting_bloc.dart';
import 'package:baleen_weather_app_test/logic/blocs/setting/setting_event.dart';
import 'package:baleen_weather_app_test/logic/blocs/setting/setting_state.dart';
import 'package:baleen_weather_app_test/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'di.dart';
import 'flavors.dart';

class MyApp extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;

  const MyApp({super.key, this.savedThemeMode});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorSchemeSeed: Colors.blue,
      ),
      dark: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.blue,
      ),
      initial: savedThemeMode ?? AdaptiveThemeMode.light,
      builder: (theme, darkTheme) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<SettingBloc>(
              create: (context) => getIt<SettingBloc>()..add(LoadLocale()),
            ),
          ],
          child: BlocBuilder<SettingBloc, SettingState>(
            builder: (context, localeState) {
              return MaterialApp.router(
                locale: Locale(localeState.locale ?? "en"),
                routerConfig: appRouter,
                title: F.title,
                debugShowCheckedModeBanner: true,
                theme: theme,
                darkTheme: darkTheme,
                localizationsDelegates: [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: AppLocalizations.supportedLocales,
              );
            },
          ),
        );
      },
      debugShowFloatingThemeButton: false,
    );
  }
}