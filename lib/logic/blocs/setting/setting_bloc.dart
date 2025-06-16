import 'package:baleen_weather_app_test/logic/blocs/setting/setting_event.dart';
import 'package:baleen_weather_app_test/logic/blocs/setting/setting_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  final Logger _logger = Logger();

  SettingBloc() : super(const SettingState()) {
    on<LoadLocale>(_loadLocale);
    on<ChangeLocale>(_changeLocale);
  }

  Future<void> _loadLocale(LoadLocale event, Emitter<SettingState> emit) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final localeCode = prefs.getString('locale') ?? 'en';
      emit(state.copyWith(locale: localeCode));
    } catch (e) {
      _logger.e(e);
    }
  }

  Future<void> _changeLocale(ChangeLocale event, Emitter<SettingState> emit) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('locale', event.locale);
      emit(state.copyWith(locale: event.locale));
    } catch (e) {
      _logger.e(e);
    }
  }

}