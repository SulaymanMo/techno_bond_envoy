import 'package:dio/dio.dart';

abstract class Failure {
  final String ex;
  const Failure(this.ex);
}

final class DioFailure extends Failure {
  const DioFailure._(super.ex);

  factory DioFailure(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return const DioFailure._('Connect timeout.');
      case DioExceptionType.sendTimeout:
        return const DioFailure._('Send timeout.');
      case DioExceptionType.receiveTimeout:
        return const DioFailure._('Receive timeout.');
      case DioExceptionType.badResponse:
        return DioFailure._fromResponse(
          dioException.response?.statusCode,
          dioException.response?.data?["message"],
        );
      case DioExceptionType.cancel:
        return const DioFailure._('Request was canceled.');
      case DioExceptionType.unknown:
        if (dioException.message == 'SocketException') {
          return const DioFailure._('Check Internet.');
        } else {
          return const DioFailure._('Unknown error, Please try later!');
        }
      default:
        return const DioFailure._('Oops... Please try later!');
    }
  }

  factory DioFailure._fromResponse(int? code, String msg) {
    if (code == 400 || code == 401 || code == 403) {
      return DioFailure._(msg);
    } else if (code == 404) {
      return DioFailure._(msg);
    } else if (code == 500) {
      return DioFailure._(msg);
    }
    return const DioFailure._('Oops... Response failure!');
  }
}

final class ResponseFailure extends Failure {
  const ResponseFailure(super.ex);
}

final class UnknownFailure extends Failure {
  UnknownFailure(super.ex);
}
