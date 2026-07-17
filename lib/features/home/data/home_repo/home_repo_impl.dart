import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerece_app/core/api_service.dart';
import 'package:e_commerece_app/core/errors/failure.dart';
import 'package:e_commerece_app/core/utils/app_constatn.dart';
import 'package:e_commerece_app/features/home/data/home_repo/home_repo.dart';
import 'package:e_commerece_app/features/home/data/models/catygroy_model.dart';
import 'package:e_commerece_app/features/home/data/models/product_model.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiService _apiService;

  HomeRepoImpl({required this._apiService});
  @override
  Future<Either<Failure, List<CategoryModel>>> getAllCategory() async {
    try {
      var data = await _apiService.getData( endPoint: AppConstant.categoriesEndPoint);
      List<CategoryModel> categories = [];
      for (var category in data["data"]) {
        categories.add(CategoryModel.fromJson(category));
      }
      return right(categories);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioEx(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getAllProducts() {
    throw UnimplementedError();
  }
}
