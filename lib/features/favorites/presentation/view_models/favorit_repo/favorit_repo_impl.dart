import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerece_app/core/api_service.dart';
import 'package:e_commerece_app/core/errors/failure.dart';
import 'package:e_commerece_app/core/utils/app_constatn.dart';
import 'package:e_commerece_app/features/favorites/presentation/view_models/favorit_repo/favorit_repo.dart';
import 'package:e_commerece_app/features/home/data/models/product_model.dart';

class FavoritRepoImpl extends FavoritRepo {
  final ApiService _apiService;

  FavoritRepoImpl({required this._apiService});

  @override
  Future<Either<Failure, List<ProductModel>>> getFavorits({
    Map<String, dynamic>? headers,
  }) async {
    try {
      var response = await _apiService.getData(
        endPoint: AppConstant.wishlist,
        headers: headers,
      );
      List<ProductModel> data = [];
      for (var product in response["data"]) {
        data.add(ProductModel.fromJson(product));
      }
      return right(data);
      // return right(response.da)
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioEx(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
