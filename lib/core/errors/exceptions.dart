class UnExceptedServerException implements Exception {
  final String message;
  final int statusCode;

  UnExceptedServerException({
    required this.message,
    required this.statusCode,
  });

}

