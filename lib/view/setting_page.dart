import 'package:baleen_weather_app_test/l10n/app_localizations.dart';
import 'package:baleen_weather_app_test/logic/blocs/setting/setting_bloc.dart';
import 'package:baleen_weather_app_test/logic/blocs/setting/setting_event.dart';
import 'package:baleen_weather_app_test/widgets/appbars/custom_app_bar.dart';
import 'package:baleen_weather_app_test/widgets/dialogs/language_dialog.dart';
import 'package:baleen_weather_app_test/widgets/settings_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppLocalizations.of(context)!.settings),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 30),
        child: SettingsMenu(
          onChangeLanguageTap: () {
            showDialog(
              context: context,
              builder: (_) => LanguageDialog(
                onLanguageSelected: (localeCode) {
                  context.read<SettingBloc>().add(ChangeLocale(locale: localeCode));
                },
              ),
            );
          },
        ),
      ),
    );
  }

}
