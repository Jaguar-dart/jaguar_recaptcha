part of jaguar_recaptcha.src;

/// reCAPTCHA response
class RecaptchaResponse {
  /// Success
  bool success;

  /// timestamp of the challenge load
  DateTime timestamp;

  /// the hostname of the site where the reCAPTCHA was solved
  String hostname;

  /// Error codes
  List<RecaptchaError> errorCodes;

  /// Serializer for [RecaptchaResponse]
  static final RecaptchaResponseSerializer serializer =
  new RecaptchaResponseSerializer();
}

/// reCAPTCHA response for android
class RecaptchaAndroidResponse {
  /// Success
  bool success;

  /// timestamp of the challenge load
  DateTime timestamp;

  /// the package name of the app where the reCAPTCHA was solved
  String apkPackageName;

  /// Error codes
  List<RecaptchaError> errorCodes;

  /// Serializer for [RecaptchaAndroidResponse]
  static final RecaptchaAndroidResponseSerializer serializer =
  new RecaptchaAndroidResponseSerializer();
}

/// Error code in response
class RecaptchaError {
  /// Integer id of the error code
  final int id;

  /// String represenation of error code
  final String code;

  /// Message of error code
  final String message;

  const RecaptchaError._(this.id, this.code, this.message);

  static const RecaptchaError missingInputSecret = const RecaptchaError._(
      0, 'missing-input-secret', 'The secret parameter is missing');

  static const RecaptchaError invalidInputSecret = const RecaptchaError._(1,
      'invalid-input-secret', 'The secret parameter is invalid or malformed');

  static const RecaptchaError missingInputResponse = const RecaptchaError._(
      2, 'missing-input-response', 'The response parameter is missing');

  static const RecaptchaError invalidInputResponse = const RecaptchaError._(
      3,
      'invalid-input-response',
      'The response parameter is invalid or malformed');

  static const RecaptchaError badRequest = const RecaptchaError._(
      4, 'bad-request', 'The request is invalid or malformed');

  static List<RecaptchaError> values = [
    missingInputSecret,
    invalidInputSecret,
    missingInputResponse,
    invalidInputResponse,
    badRequest
  ];
}