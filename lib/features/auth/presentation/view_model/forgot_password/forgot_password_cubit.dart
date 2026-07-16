import 'package:e_commerece_app/features/auth/data/auth_repo/auth_repo.dart';
import 'package:e_commerece_app/features/auth/data/models/forgot_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit({required this._authRepo})
    : super(ForgotPasswordInitial());

  final AuthRepo _authRepo;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  void forgotPassword() async {
    if (!formKey.currentState!.validate()) return;
    emit(ForgotPasswordLoading());

    var result = await _authRepo.forgotPassword(email: emailController.text);
    result.fold(
      (fail) {
        emit(ForgotPasswordFailure(errMessage: fail.errorMessage));
      },
      (success) {
        emit(ForgotPasswordSuccess( forgotResponseModel: success));
      },
    );
  }
}
