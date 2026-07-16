import 'dart:developer';

import 'package:e_commerece_app/core/share.dart';
import 'package:e_commerece_app/core/utils/app_constatn.dart';
import 'package:e_commerece_app/features/auth/data/auth_repo/auth_repo.dart';
import 'package:e_commerece_app/features/auth/data/models/auth_response_model.dart';
import 'package:e_commerece_app/features/auth/data/models/signup_request_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit({required this._authRepo}) : super(SignupInitial());
  final AuthRepo _authRepo;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  // ✅ متغيرين منفصلين لإظهار/إخفاء كلمة المرور
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  void signUp() async {
    if (!formKey.currentState!.validate()) return;
    emit(SignupLoading());
    SignUpModel signUpData = SignUpModel(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
      rePassword: rePasswordController.text,
      phone: phoneController.text,
    );
    var result = await _authRepo.signup(signUpData: signUpData);
    result.fold(
      (fail) {
        emit(SignupFailure(errMessage: fail.errorMessage));
      },
      (success) {
        reset();
        emit(SignupSuccess(userModel: success));
        CacheHelper.saveData(key: AppConstatn.tokenKey, value: success.token);
        log("tokeeen ${CacheHelper.getData(key: AppConstatn.tokenKey)}");
      },
    );
  }

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(SignupPasswordVisibilityChanged()); // إعادة البناء
  }

  // ✅ دالة منفصلة لتأكيد كلمة المرور
  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    emit(SignupPasswordVisibilityChanged()); // إعادة البناء
  }

  void reset() {
    isPasswordVisible = false;
    isConfirmPasswordVisible = false;
    formKey.currentState?.reset();
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    rePasswordController.clear();
    phoneController.clear();
    emit(SignupInitial());
  }

  // تنظيف الموارد
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
    phoneController.dispose();
  }
}
