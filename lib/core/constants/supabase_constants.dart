/// Table and storage bucket names, centralized so feature repositories
/// never hardcode raw strings when calling `supabase.from(...)` /
/// `.storage.from(...)`. Mirrors SMENA_DATABASE_DESIGN §2.
class SupabaseTables {
  SupabaseTables._();

  static const String users = 'users';
  static const String workerProfiles = 'worker_profiles';
  static const String employerProfiles = 'employer_profiles';
  static const String categories = 'job_categories';
  static const String cities = 'cities';
  static const String jobs = 'jobs';
  static const String applications = 'applications';
  static const String conversations = 'conversations';
  static const String messages = 'messages';
  static const String reviews = 'reviews';
  static const String payments = 'payments';
  static const String paymentMethods = 'payment_methods';
  static const String withdrawals = 'withdrawals';
  static const String notifications = 'notifications';
  static const String reports = 'reports';
  static const String disputes = 'disputes';
  static const String verificationDocuments = 'verification_documents';
}

class SupabaseBuckets {
  SupabaseBuckets._();

  static const String avatars = 'avatars';
  static const String employerLogos = 'employer-logos';
  static const String chatImages = 'chat-images';
  static const String verificationDocs = 'verification-documents';
}
