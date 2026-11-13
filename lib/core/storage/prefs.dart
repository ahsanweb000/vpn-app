import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  Prefs._();

  static late SharedPreferences _instance;

  static const String _kLocaleCode = 'locale_code';
  static const String _kLanguageChosen = 'language_chosen';
  static const String _kVpnConsentAccepted = 'vpn_consent_accepted';
  static const String _kSelectedServerId = 'selected_server_id';
  static const String _kServersCacheJson = 'servers_cache_json';
  static const String _kSplitEnabled = 'split_enabled';
  static const String _kSplitBypassPackages = 'split_bypass_packages';
  static const String _kIsPremium = 'is_premium';
  static const String _kPassExpiresAtMs = 'pass_expires_at_ms';
  static const String _kConnectSuccessCount = 'connect_success_count';
  static const String _kRatePromptDone = 'rate_prompt_done';

  static Future<void> init() async {
    _instance = await SharedPreferences.getInstance();
  }

  // locale_code (String?, default: null)
  static String? get localeCode => _instance.getString(_kLocaleCode);
  static Future<bool> setLocaleCode(String? value) async {
    if (value == null) {
      return _instance.remove(_kLocaleCode);
    }
    return _instance.setString(_kLocaleCode, value);
  }

  // language_chosen (bool, default: false)
  static bool get languageChosen =>
      _instance.getBool(_kLanguageChosen) ?? false;
  static Future<bool> setLanguageChosen(bool value) =>
      _instance.setBool(_kLanguageChosen, value);

  // vpn_consent_accepted (bool, default: false)
  static bool get vpnConsentAccepted =>
      _instance.getBool(_kVpnConsentAccepted) ?? false;
  static Future<bool> setVpnConsentAccepted(bool value) =>
      _instance.setBool(_kVpnConsentAccepted, value);

  // selected_server_id (String?, default: null -> Auto select)
  static String? get selectedServerId =>
      _instance.getString(_kSelectedServerId);
  static Future<bool> setSelectedServerId(String? value) async {
    if (value == null) {
      return _instance.remove(_kSelectedServerId);
    }
    return _instance.setString(_kSelectedServerId, value);
  }

  // servers_cache_json (String?, default: null)
  static String? get serversCacheJson =>
      _instance.getString(_kServersCacheJson);
  static Future<bool> setServersCacheJson(String? value) async {
    if (value == null) {
      return _instance.remove(_kServersCacheJson);
    }
    return _instance.setString(_kServersCacheJson, value);
  }

  // split_enabled (bool, default: false)
  static bool get splitEnabled =>
      _instance.getBool(_kSplitEnabled) ?? false;
  static Future<bool> setSplitEnabled(bool value) =>
      _instance.setBool(_kSplitEnabled, value);

  // split_bypass_packages (List<String>, default: [])
  static List<String> get splitBypassPackages =>
      _instance.getStringList(_kSplitBypassPackages) ?? <String>[];
  static Future<bool> setSplitBypassPackages(List<String> value) =>
      _instance.setStringList(_kSplitBypassPackages, value);

  // is_premium (bool, default: false)
  static bool get isPremium => _instance.getBool(_kIsPremium) ?? false;
  static Future<bool> setIsPremium(bool value) =>
      _instance.setBool(_kIsPremium, value);

  // pass_expires_at_ms (int?, default: null)
  static int? get passExpiresAtMs => _instance.getInt(_kPassExpiresAtMs);
  static Future<bool> setPassExpiresAtMs(int? value) async {
    if (value == null) {
      return _instance.remove(_kPassExpiresAtMs);
    }
    return _instance.setInt(_kPassExpiresAtMs, value);
  }

  // connect_success_count (int, default: 0)
  static int get connectSuccessCount =>
      _instance.getInt(_kConnectSuccessCount) ?? 0;
  static Future<bool> setConnectSuccessCount(int value) =>
      _instance.setInt(_kConnectSuccessCount, value);

  // rate_prompt_done (bool, default: false)
  static bool get ratePromptDone =>
      _instance.getBool(_kRatePromptDone) ?? false;
  static Future<bool> setRatePromptDone(bool value) =>
      _instance.setBool(_kRatePromptDone, value);
}
