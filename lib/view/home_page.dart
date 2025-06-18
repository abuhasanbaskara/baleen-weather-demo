import 'package:app_settings/app_settings.dart';
import 'package:baleen_weather_app_test/logic/blocs/home/home_bloc.dart';
import 'package:baleen_weather_app_test/logic/blocs/home/home_event.dart';
import 'package:baleen_weather_app_test/logic/blocs/home/home_state.dart';
import 'package:baleen_weather_app_test/utils/forecast_filter_util.dart';
import 'package:baleen_weather_app_test/utils/string_util.dart';
import 'package:baleen_weather_app_test/utils/temperature_util.dart';
import 'package:baleen_weather_app_test/utils/weather_lottie_util.dart';
import 'package:baleen_weather_app_test/widgets/current_forecast.dart';
import 'package:baleen_weather_app_test/widgets/dialogs/error_dialog.dart';
import 'package:baleen_weather_app_test/widgets/current_weather_display.dart';
import 'package:baleen_weather_app_test/widgets/dialogs/location_disabled_dialog.dart';
import 'package:baleen_weather_app_test/widgets/error_message_util.dart';
import 'package:baleen_weather_app_test/widgets/five_day_forecast.dart';
import 'package:baleen_weather_app_test/widgets/fullscreen_loading.dart';
import 'package:baleen_weather_app_test/widgets/appbars/search_app_bar.dart';
import 'package:baleen_weather_app_test/widgets/saved_weather_list.dart';
import 'package:baleen_weather_app_test/widgets/search_tips.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state.isError) {
          context.read<HomeBloc>().add(ConfirmedCityNotFound());
          showDialog(
            context: context,
            builder: (context) => ErrorDialog(
              title: ErrorMessageUtil.getErrorTitle(state.errorMessage),
              message: ErrorMessageUtil.getErrorMessage(state.errorMessage),
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
        if (state.isShowToast) {
          context.read<HomeBloc>().add(ShowToastDone());
          Fluttertoast.showToast(
            msg: "Refresh Success!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
          );
        }
      },
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Stack(
            children: [
              Scaffold(
                appBar: _buildAppBar(context, state),
                body: _buildBody(context, state),
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    context.read<HomeBloc>().add(GetCurrentLocation());
                  },
                  tooltip: 'Get Current Location',
                  child: const Icon(Icons.my_location),
                ),
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
        context.read<HomeBloc>().add(SearchUnFocus());
      },
      onSettingsTap: (){
        context.push('/setting');
      },
      onSearchFocus: () {
        context.read<HomeBloc>().add(SearchFocus());
      },
      onSearchUnfocus: () {
        context.read<HomeBloc>().add(SearchUnFocus());
      },
    );
  }

  Widget _buildBody(BuildContext context, HomeState state) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(right: 16, left: 16, bottom: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            if (state.isSearchFocus)
              _buildSavedForecast(context, state)
            else
              ..._buildWeatherContent(state),
          ],
        ),
      ),
    );
  }

  Widget _buildSavedForecast(BuildContext context, HomeState state) {
    final weatherSavedList = state.savedWeatherResponses;

    if (weatherSavedList == null) {
      return Padding(
        padding: const EdgeInsets.only(top: 200),
        child: const Center(
          child: SearchTips(),
        ),
      );
    }

    return SavedWeatherList(
      savedWeatherResponse: weatherSavedList,
      onTapItem: (item) {
        context.read<HomeBloc>().add(SearchUnFocus());
        context.read<HomeBloc>().add(ShowSelectedSavedWeather(savedWeatherResponse: item));
      },
      onReloadItem: (item) {
        context.read<HomeBloc>().add(RefreshSavedWeather(savedWeatherResponse: item));
      },
      onDeleteItem: (item) {
        context.read<HomeBloc>().add(DeleteSavedWeather(savedWeatherResponse: item));
      },
    );
  }

  List<Widget> _buildWeatherContent(HomeState state) {
    return [
      _buildCurrentWeather(state),
      const SizedBox(height: 10),
      _buildCurrentForecast(state),
      const SizedBox(height: 10),
      _buildFiveDayForecast(state),
    ];
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
      isCurrentLocation: state.weatherResponse?.isCurrentLocation ?? false,
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
