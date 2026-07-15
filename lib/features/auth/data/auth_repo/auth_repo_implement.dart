import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerece_app/core/api_service.dart';
import 'package:e_commerece_app/core/errors/failure.dart';
import 'package:e_commerece_app/features/auth/data/auth_repo/auth_repo.dart';
import 'package:e_commerece_app/features/auth/data/models/signup_request_model.dart';
import 'package:e_commerece_app/features/auth/data/models/signup_response_model.dart';

class AuthRepoImplement extends AuthRepo {
  final ApiService _apiService;

  AuthRepoImplement({required this._apiService});

  @override
  Future<Either<Failure, UserModel>> signup({
    required SignUpModel signUpData,
  }) async {
    try {
      var response = await _apiService.post(
        endPoint: "api/v1/auth/signup",
        data: signUpData.toJson(),
      );
      var user = UserModel.fromJson(response);
      return right(user);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioEx(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
