import 'dart:async';
import 'package:flutter/foundation.dart';
import '../../core/storage/prefs.dart';

class EntitlementService extends ChangeNotifier {
  bool _isPremium = false;
  DateTime? _passExpiresAt;
  Timer? _passTimer;

  EntitlementService() {
    _loadState();
  }

  void _loadState() {
    _isPremium = Prefs.isPremium;
    final expiresMs = Prefs.passExpiresAtMs;
    if (expiresMs != null) {
      final expiry = DateTime.fromMillisecondsSinceEpoch(expiresMs);
      if (expiry.isAfter(DateTime.now())) {
        _passExpiresAt = expiry;
        _scheduleTimer(expiry.difference(DateTime.now()));
      } else {
        _passExpiresAt = null;
        Prefs.setPassExpiresAtMs(null);
      }
    }
  }

  bool get isPremium => _isPremium;

  DateTime? get passExpiresAt => _passExpiresAt;

  bool get hasPremiumAccess {
    if (_isPremium) return true;
    final expiry = _passExpiresAt;
    if (expiry != null && DateTime.now().isBefore(expiry)) {
      return true;
    }
    return false;
  }

  bool get adsEnabled => !_isPremium;

  Future<void> setPremium(bool value) async {
    if (_isPremium == value) return;
    _isPremium = value;
    await Prefs.setIsPremium(value);
    notifyListeners();
  }

  Future<void> grantPass(Duration duration) async {
    final now = DateTime.now();
    final DateTime target;
    if (_passExpiresAt != null && _passExpiresAt!.isAfter(now)) {
      target = _passExpiresAt!.add(duration);
    } else {
      target = now.add(duration);
    }

    _passExpiresAt = target;
    await Prefs.setPassExpiresAtMs(target.millisecondsSinceEpoch);
    _scheduleTimer(target.difference(DateTime.now()));
    notifyListeners();
  }

  Future<void> clearPass() async {
    _passTimer?.cancel();
    _passTimer = null;
    _passExpiresAt = null;
    await Prefs.setPassExpiresAtMs(null);
    notifyListeners();
  }

  void _scheduleTimer(Duration duration) {
    _passTimer?.cancel();
    _passTimer = Timer(duration, () {
      _passExpiresAt = null;
      Prefs.setPassExpiresAtMs(null);
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _passTimer?.cancel();
    super.dispose();
  }
}
