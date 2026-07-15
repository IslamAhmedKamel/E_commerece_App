import 'package:dio/dio.dart';

class Failure {
  final String errorMessage;

  Failure({required this.errorMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errorMessage});
  factory ServerFailure.fromDioEx(DioException dioEx) {
    switch (dioEx.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errorMessage: "connectionTimeout");
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errorMessage: "connectionTimeout");
      case DioExceptionType.badCertificate:
        return ServerFailure(errorMessage: "connectionTimeout");
      case DioExceptionType.badResponse:
        return ServerFailure.fromBadResponse(json: dioEx.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure(errorMessage: "connectionTimeout");
      case DioExceptionType.connectionError:
        return ServerFailure(errorMessage: "connectionTimeout");
      case DioExceptionType.unknown:
        return ServerFailure(errorMessage: "connectionTimeout");

      case DioExceptionType.transformTimeout:
        return ServerFailure(errorMessage: "connectionTimeout");
    }
  }

  factory ServerFailure.fromBadResponse({required Map<String, dynamic> json}) {
    if (json["status"] == 400 ||
        json["status"] == 401 ||
        json["status"] == 403) {
      return ServerFailure(errorMessage: json["errorMessage"]);
    } else if (json["status"] == 500) {
      return ServerFailure(errorMessage: "فيه مشكلة في السرفير");
    } else if (json["status"] == 404) {
      return ServerFailure(errorMessage: "الصفحة غير موجودة");
    } else {
      return ServerFailure(errorMessage: "there was an error");
    }
  }
}
