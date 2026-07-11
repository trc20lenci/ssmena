/// Centralized keys for local (SharedPreferences) and secure storage,
/// so features never hardcode raw strings. SMENA_CODING_GUIDE §10.
class StorageKeys {
  StorageKeys._();

  // Secure storage
  static const String cachedUserId = 'cached_user_id';
  static const String cachedUserRole = 'cached_user_role';

  // Local (non-sensitive) storage
  static const String jobFeedFilters = 'job_feed_filters';
  static const String recentSearches = 'recent_searches';
  static const String localeCode = 'locale_code';
  static const String hasSeenOnboarding = 'has_seen_onboarding';
}
