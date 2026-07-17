import 'package:e_commerece_app/features/home/data/home_repo/home_repo.dart';
import 'package:e_commerece_app/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_all_products_state.dart';

class GetAllProductsCubit extends Cubit<GetAllProductsState> {
  GetAllProductsCubit({required this._homeRepo})
    : super(GetAllProductsInitial());

  final HomeRepo _homeRepo;
  void getData() async {
    emit(GetAllProductsLoading());
    var result = await _homeRepo.getAllProducts();
    result.fold(
      (failed) {
        emit(GetAllProductsFailure(errorMessage: failed.errorMessage));
      },
      (products) {
        emit(GetAllProductsSucsecefull(products: products));
      },
    );
  }
}
