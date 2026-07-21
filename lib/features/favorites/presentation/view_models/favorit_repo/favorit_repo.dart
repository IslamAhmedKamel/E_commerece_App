import 'package:dartz/dartz.dart';
import 'package:e_commerece_app/core/errors/failure.dart';
import 'package:e_commerece_app/features/home/data/models/product_model.dart';

abstract class FavoritRepo {
  Future<Either<Failure, List<ProductModel>>> getFavorits({  Map<String, dynamic>? headers,});
}
