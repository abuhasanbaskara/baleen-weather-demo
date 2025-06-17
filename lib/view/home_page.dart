import 'package:app_settings/app_settings.dart';
import 'package:baleen_weather_app_test/logic/blocs/home/home_bloc.dart';
import 'package:baleen_weather_app_test/logic/blocs/home/home_event.dart';
import 'package:baleen_weather_app_test/logic/blocs/home/home_state.dart';
import 'package:baleen_weather_app_test/utils/forecast_filter_util.dart';
import 'package:baleen_weather_app_test/utils/string_util.dart';
import 'package:baleen_weather_app_test/utils/temperature_util.dart';
import 'package:baleen_weather_app_test/utils/weather_lottie_util.dart';
import 'package:baleen_weather_app_test/widgets/current_forecast.dart';
import 'package:baleen_weather_app_test/widgets/dialogs/city_not_found_dialog.dart';
import 'package:baleen_weather_app_test/widgets/current_weather_display.dart';
import 'package:baleen_weather_app_test/widgets/dialogs/location_disabled_dialog.dart';
import 'package:baleen_weather_app_test/widgets/error_message_util.dart';
import 'package:baleen_weather_app_test/widgets/five_day_forecast.dart';
import 'package:baleen_weather_app_test/widgets/fullscreen_loading.dart';
import 'package:baleen_weather_app_test/widgets/appbars/search_app_bar.dart';
import 'package:baleen_weather_app_test/widgets/search_tips.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state.isCityNotFound) {
          context.read<HomeBloc>().add(ConfirmedCityNotFound());
          showDialog(
            context: context,
            builder: (context) => CityNotFoundDialog(
              title: ErrorMessageUtil.getErrorTitle(state.errorWeatherResponse),
              message: ErrorMessageUtil.getErrorMessage(state.errorWeatherResponse),
            ),
          );
        }
        if (state.isShowLocationErrorDialog) {
          context.read<HomeBloc>().add(ShowLocationErrorDialogDone());
          showDialog(
            context: context,
            builder: (_) => LocationDisabledDialog(
              onOpenSettings: () {
                AppSettings.openAppSettings(type: AppSettingsType.location);
                Navigator.of(context).pop();
              },
              onDismiss: () {
                Navigator.of(context).pop();
              },
            ),
          );
        }
        if (state.isGetCurrentLocationDone) {
          context.read<HomeBloc>().add(GetCurrentLocationDone());
        }
      },
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Stack(
            children: [
              Scaffold(
                appBar: _buildAppBar(context, state),
                body: _buildBody(state),
              ),
              if (state.isWeatherResponseLoading) const FullScreenLoading(),
            ],
          );
        },
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context, HomeState state) {
    return SearchAppBar(
      controller: _searchController,
      onSearchChanged: (searchText) {
        context.read<HomeBloc>().add(GetWeatherByCityName(cityName: searchText));
      },
      onSettingsTap: (){
        context.push('/setting');
      },
    );
  }

  Widget _buildBody(HomeState state) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(right: 16, left: 16, bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            _buildCurrentWeather(state),
            const SizedBox(height: 10),
            _buildCurrentForecast(state),
            const SizedBox(height: 10),
            _buildFiveDayForecast(state),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrentWeather(HomeState state) {
    final weatherList = state.weatherResponse?.list;
    final currentWeather = (weatherList != null && weatherList.isNotEmpty) ? weatherList[0] : null;

    if (currentWeather == null) {
      return Padding(
        padding: const EdgeInsets.only(top: 200),
        child: const Center(
          child: SearchTips(),
        ),
      );
    }

    return CurrentWeatherDisplay(
      cityName: "${state.weatherResponse?.city?.name}, ${state.weatherResponse?.city?.country}",
      lottiePath: WeatherLottieUtil.getLottieAsset(currentWeather.weather?[0].id),
      temperature: TemperatureUtil.kelvinToCelsius(currentWeather.main?.temp),
      description: StringUtil.capitalize(currentWeather.weather?[0].description ?? "Unknown description"),
    );
  }

  Widget _buildCurrentForecast(HomeState state) {
    final weatherList = state.weatherResponse?.list;

    if (weatherList == null || weatherList.isEmpty) {
      return Container();
    }

    final filteredList = ForecastFilterUtil.currentFiltered(weatherList);

    return CurrentForecast(
      forecasts: filteredList,
    );
  }

  Widget _buildFiveDayForecast(HomeState state) {
    final weatherList = state.weatherResponse?.list;

    if (weatherList == null || weatherList.isEmpty) {
      return Container();
    }

    final filteredList = ForecastFilterUtil.nextDayFiltered(weatherList);

    return FiveDayForecast(
      forecasts: filteredList,
    );
  }

}
