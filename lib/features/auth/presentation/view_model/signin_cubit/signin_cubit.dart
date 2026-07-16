import 'dart:developer';

import 'package:e_commerece_app/features/auth/data/auth_repo/auth_repo.dart';
import 'package:e_commerece_app/features/auth/data/models/auth_response_model.dart';
import 'package:e_commerece_app/features/auth/data/models/signin_request_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit({required this._authRepo}) : super(SigninInitial());
  final AuthRepo _authRepo;
  bool isPasswordVisible = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void signin() async {
    if (!formKey.currentState!.validate()) return;
    emit(SigninLoading());
    SignInModel signinData = SignInModel(
      email: emailController.text,
      password: passwordController.text,
    );
    var result = await _authRepo.signin(signinData: signinData);
    result.fold(
      (fail) {
        emit(SigninFailure(errMessage: fail.errorMessage));
      },
      (success) {
        reset();
        log(success.message);
        emit(SigninSuccess(userModel: success));
      },
    );
  }

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(SigninPasswordVisibilityChanged()); // إعادة البناء
  }

  void reset() {
    isPasswordVisible = false;
    formKey.currentState?.reset();
    emailController.clear();
    passwordController.clear();
  }

  // تنظيف الموارد
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}
