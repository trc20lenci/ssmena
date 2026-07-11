/// Business-rule limits pulled directly from SMENA_MASTER_CONTEXT (PRD).
/// Centralized so forms/validators never hardcode these numbers
/// (SMENA_CODING_GUIDE §10 — "no magic numbers").
class AppLimits {
  AppLimits._();

  // OTP — PRD §24.1
  static const int otpLength = 6;
  static const Duration otpValidity = Duration(minutes: 5);
  static const int otpMaxAttempts = 5;
  static const int otpMaxRequestsPerHour = 5;

  // Jobs — PRD §11.1
  static const int jobTitleMaxLength = 100;
  static const int jobDescriptionMaxLength = 2000;
  static const double jobPayMin = 5;
  static const double jobPayMax = 5000;
  static const int jobWorkersMin = 1;
  static const int jobWorkersMax = 100;
  static const int jobRequirementsMax = 10;
  static const int jobWhatToBringMax = 5;

  // Applications — PRD §12
  static const int applicationMessageMaxLength = 200;

  // Chat — PRD §21.3
  static const int chatMessageMaxLength = 500;
  static const int chatQuickReplyMaxLength = 200;
  static const int chatMaxMessagesPerHour = 30;

  // Reviews — PRD §13.1
  static const int reviewTextMaxLength = 500;
  static const int ratingWindowDays = 7;

  // Profiles — PRD §9.1 / §9.3
  static const int workerAboutMaxLength = 200;
  static const int employerDescriptionMaxLength = 500;

  // Withdrawals — PRD §9.2
  static const double withdrawalMin = 30;

  // Fees — PRD §2.1
  static const double serviceFeeRate = 0.12;
}
