import 'package:e_commerece_app/core/share.dart';
import 'package:e_commerece_app/core/utils/app_constatn.dart';
import 'package:e_commerece_app/features/favorites/presentation/view_models/favorit_repo/favorit_repo.dart';
import 'package:e_commerece_app/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_favorits_state.dart';

class GetFavoritsCubit extends Cubit<GetFavoritsState> {
  GetFavoritsCubit({required this._favoritRepo}) : super(GetFavoritsInitial());
  final FavoritRepo _favoritRepo;

  // قائمة المنتجات المفضلة

  Future<void> getFavorits() async {
    emit(GetFavoritsLoading());
    var result = await _favoritRepo.getFavorits(
      headers: {
        AppConstant.tokenKey: CacheHelper.getData(key: AppConstant.tokenKey),
      },
    );

    result.fold(
      (failed) {
        emit(GetFavoritsFailur(errorMessage: failed.errorMessage));
      },
      (succese) {
        emit(GetFavoritsSuceces(products: succese));
      },
    );
  }
}
