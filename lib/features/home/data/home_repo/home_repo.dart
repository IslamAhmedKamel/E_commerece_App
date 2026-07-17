import 'package:dartz/dartz.dart';
import 'package:e_commerece_app/core/errors/failure.dart';
import 'package:e_commerece_app/features/home/data/models/catygroy_model.dart';
import 'package:e_commerece_app/features/home/data/models/product_model.dart';

abstract class HomeRepo {
  //

  Future<Either<Failure, List<CategoryModel>>> getAllCategory();
  Future<Either<Failure, List<ProductModel>>> getAllProducts();
}
