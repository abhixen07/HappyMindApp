class AppException implements Exception {
  final String? message;
  final String? prefix;

  AppException([this.message, this.prefix]);

  @override
  String toString() {
    return '$prefix $message';
  }
}

class InternetException extends AppException {
  InternetException([String? message]) : super(message, 'No Internet Connection:');
}

class RequestTimeOutException extends AppException {
  RequestTimeOutException([String? message]) : super(message, 'Request Timeout');
}

class ServerException extends AppException {
  ServerException([String? message]) : super(message, 'Internal Server Error:');
}

class FetchDataException extends AppException {
  FetchDataException([String? message]) : super(message, 'Error During Communication:');
}

class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message, 'Bad Request');
}

class UnauthorizedException extends AppException {
  UnauthorizedException([String? message]) : super(message, 'Unauthorized Request' );
}
