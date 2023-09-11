class AppStrings {
  static const String appName = 'CoinPulse';
  static const String welcomeMessage = 'Welcome to $appName';
  static const String settingsTitle = 'Settings';

  static String getCurrencyRateTextFormat(
      {String? currencyRateFromTxt,
      String? fromCcName,
      String? currencyRateToTxt,
      String? toCcName,
      String? toCurrencyRate}) {
    return toCurrencyRate == null
        ? "$currencyRateFromTxt $fromCcName ~ $currencyRateToTxt $toCcName"
        : "~\$$toCurrencyRate";
  }
}
