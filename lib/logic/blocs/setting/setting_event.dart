import 'package:equatable/equatable.dart';

abstract class SettingEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ChangeLocale extends SettingEvent {
  final String locale;

  ChangeLocale({required this.locale});

  @override
  List<Object> get props => [locale];
}

class LoadLocale extends SettingEvent {

  @override
  List<Object> get props => [];
}
