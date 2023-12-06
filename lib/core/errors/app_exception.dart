class AppException implements Exception {
  final int code;
  final String message;
  final String prefix;

  AppException(this.code, this.message, this.prefix);

  @override
  String toString() {
    return "$code: $prefix $message";
  }

  int get getCode => code;
  String get getMessage => message;
  String get getPrefix => prefix;
}

class FetchDataException extends AppException {
  FetchDataException({required String message})
      : super(
          400,
          message,
          "Error During Communication: ",
        );
}

class BadRequestException extends AppException {
  BadRequestException({required String message})
      : super(400, message, "Invalid Request: ");
}

class UnauthorizedException extends AppException {
  UnauthorizedException({required String message})
      : super(401, message, "Unauthorized: ");
}

class NotFoundException extends AppException {
  NotFoundException({required String message})
      : super(404, message, "Not found: ");
}

class InternalServerException extends AppException {
  InternalServerException({required String message})
      : super(500, message, "Internal Server Error: ");
}

class InvalidInputException extends AppException {
  InvalidInputException({required String message})
      : super(20201, message, 'Oh no!');
}
