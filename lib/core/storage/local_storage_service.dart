import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Thin wrapper around SharedPreferences for non-sensitive local data
/// (persisted job filters, recent searches, onboarding flags).
class LocalStorageService {
  LocalStorageService(this._prefs);

  final SharedPreferences _prefs;

  String? getString(String key) => _prefs.getString(key);
  Future<void> setString(String key, String value) => _prefs.setString(key, value);

  bool? getBool(String key) => _prefs.getBool(key);
  Future<void> setBool(String key, bool value) => _prefs.setBool(key, value);

  Future<void> remove(String key) => _prefs.remove(key);
}

/// Overridden in [bootstrap] before first use — SharedPreferences
/// requires async initialization, which a plain provider can't do.
final localStorageProvider = Provider<LocalStorageService>((ref) {
  throw UnimplementedError('localStorageProvider must be overridden in bootstrap()');
});
