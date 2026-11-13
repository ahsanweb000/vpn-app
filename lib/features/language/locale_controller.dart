import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import '../../core/storage/prefs.dart';

class AppLanguage {
  final String code;
  final String englishName;
  final String nativeName;

  const AppLanguage({
    required this.code,
    required this.englishName,
    required this.nativeName,
  });
}

class LocaleController extends ChangeNotifier {
  static const List<AppLanguage> supportedLanguages = [
    AppLanguage(code: 'en', englishName: 'English', nativeName: 'English'),
    AppLanguage(code: 'af', englishName: 'Afrikaans', nativeName: 'Afrikaans'),
    AppLanguage(code: 'zh', englishName: 'Chinese', nativeName: '汉语'),
    AppLanguage(code: 'cs', englishName: 'Czech', nativeName: 'čeština'),
    AppLanguage(code: 'da', englishName: 'Danish', nativeName: 'dansk'),
    AppLanguage(code: 'nl', englishName: 'Dutch', nativeName: 'Nederlands'),
    AppLanguage(code: 'fr', englishName: 'French', nativeName: 'français'),
    AppLanguage(code: 'de', englishName: 'German', nativeName: 'Deutsch'),
    AppLanguage(code: 'hi', englishName: 'Hindi', nativeName: 'हिन्दी'),
    AppLanguage(code: 'id', englishName: 'Indonesian', nativeName: 'Indonesia'),
    AppLanguage(code: 'it', englishName: 'Italian', nativeName: 'italiano'),
    AppLanguage(code: 'ja', englishName: 'Japanese', nativeName: '日本語'),
    AppLanguage(code: 'ko', englishName: 'Korean', nativeName: '한국어'),
    AppLanguage(code: 'pl', englishName: 'Polish', nativeName: 'polski'),
    AppLanguage(code: 'pt', englishName: 'Portuguese', nativeName: 'português'),
    AppLanguage(code: 'ru', englishName: 'Russian', nativeName: 'русский'),
    AppLanguage(code: 'es', englishName: 'Spanish', nativeName: 'español'),
    AppLanguage(code: 'tr', englishName: 'Turkish', nativeName: 'Türkçe'),
    AppLanguage(code: 'vi', englishName: 'Vietnamese', nativeName: 'Tiếng Việt'),
  ];

  late String _currentCode;

  LocaleController() {
    _initLocale();
  }

  void _initLocale() {
    final savedCode = Prefs.localeCode;
    if (savedCode != null && _isSupported(savedCode)) {
      _currentCode = savedCode;
    } else {
      final deviceCode = ui.PlatformDispatcher.instance.locale.languageCode;
      if (_isSupported(deviceCode)) {
        _currentCode = deviceCode;
      } else {
        _currentCode = 'en';
      }
    }
  }

  bool _isSupported(String code) {
    return supportedLanguages.any((lang) => lang.code == code);
  }

  Locale get locale => Locale(_currentCode);

  String get currentCode => _currentCode;

  Future<void> setLocale(String code) async {
    if (!_isSupported(code) || _currentCode == code) return;
    _currentCode = code;
    await Prefs.setLocaleCode(code);
    notifyListeners();
  }
}
