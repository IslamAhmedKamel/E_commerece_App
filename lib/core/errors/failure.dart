import 'package:dio/dio.dart';

class Failure {
  final String errorMessage;

  Failure({required this.errorMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errorMessage});
  factory ServerFailure.fromDioEx(DioException dioEx) {
    switch (dioEx.type) {
      case DioExceptionType.badResponse:
        return ServerFailure.fromBadResponse(json: dioEx.response);
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errorMessage: "connectionTimeout");
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errorMessage: "connectionTimeout");
      case DioExceptionType.badCertificate:
        return ServerFailure(errorMessage: "connectionTimeout");
      case DioExceptionType.cancel:
        return ServerFailure(errorMessage: "connectionTimeout");
      case DioExceptionType.connectionError:
        return ServerFailure(
          errorMessage: "No Internet Connection ,please try later",
        );
      case DioExceptionType.unknown:
        return ServerFailure(errorMessage: "connectionTimeout");

      case DioExceptionType.transformTimeout:
        return ServerFailure(errorMessage: "connectionTimeout");
    }
  }

  factory ServerFailure.fromBadResponse({Response<dynamic>? json}) {
    if (json!.statusCode == 400 ||
        json.statusCode == 401 ||
        json.statusCode == 409) {
      return ServerFailure(errorMessage: json.data["message"]);
    } else if (json.statusCode == 500) {
      return ServerFailure(errorMessage: "فيه مشكلة في السرفير");
    } else if (json.statusCode == 404) {
      return ServerFailure(errorMessage: "الصفحة غير موجودة");
    } else {
      return ServerFailure(errorMessage: "there was an");
    }
  }
}
