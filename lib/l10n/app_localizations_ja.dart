// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get settings => '設定';

  @override
  String get changeLanguage => '言語を変更';

  @override
  String get theme => 'テーマ';

  @override
  String get light => 'ライト';

  @override
  String get dark => 'ダーク';

  @override
  String get search => '検索...';

  @override
  String get fiveDayForecast => '5日間の天気予報';

  @override
  String get english => '英語';

  @override
  String get japanese => '日本語';

  @override
  String get refreshSuccess => '更新に成功しました';

  @override
  String get understood => '了解しました';

  @override
  String get locationDisabled => '位置情報が無効です';

  @override
  String get pleaseEnableLocation => 'この機能を使用するには、設定で位置情報サービスを有効にしてください';

  @override
  String get later => '後で';

  @override
  String get now => '今すぐ';

  @override
  String get myLocation => '現在地';

  @override
  String get unauthorized => '認証されていません';

  @override
  String get cityNotFound => '都市が見つかりません';

  @override
  String get internalServerError => 'サーバー内部エラー';

  @override
  String get noInternet => 'インターネット接続がありません';

  @override
  String get somethingWrong => '問題が発生しました';

  @override
  String get pleaseCheckApi => 'APIキーまたはログイン情報を確認してください';

  @override
  String get tryUsingSimpler => 'より簡単な都市名を試してください（例：東京）';

  @override
  String get pleaseTryAgain => '後で再試行してください';

  @override
  String get pleaseCheckInternet => 'インターネット接続を確認してください';

  @override
  String get searchTips => '最初に都市を検索して天気予報を表示してください\n（例：東京）';

  @override
  String get localTime => '現地時間';

  @override
  String get temperature => '気温';

  @override
  String get feelsLike => '体感温度';

  @override
  String get minTemp => '最低気温';

  @override
  String get maxTemp => '最高気温';

  @override
  String get humidity => '湿度';

  @override
  String get pressure => '気圧';

  @override
  String get seaLevel => '海面気圧';

  @override
  String get groundLevel => '地上気圧';

  @override
  String get clouds => '雲量';

  @override
  String get visibility => '視程';

  @override
  String get windSpeed => '風速';

  @override
  String get windDirection => '風向';

  @override
  String get windGust => '突風';
}
