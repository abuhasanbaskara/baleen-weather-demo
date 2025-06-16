import 'package:equatable/equatable.dart';

class SettingState extends Equatable {
  final String? locale;

  const SettingState({
    this.locale,
  });

  SettingState copyWith({
    String? locale,
  }) {
    return SettingState(
      locale: locale ?? this.locale,
    );
  }

  @override
  List<Object?> get props => [
    locale,
  ];
}