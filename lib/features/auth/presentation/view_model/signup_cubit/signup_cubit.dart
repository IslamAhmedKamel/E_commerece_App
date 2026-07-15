import 'dart:developer';

import 'package:e_commerece_app/features/auth/data/auth_repo/auth_repo.dart';
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
  bool isPasswordShow = false;
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
        log(success.token);
        emit(SignupSuccess());
      },
    );
  }

  // تبديل إظهار/إخفاء كلمة المرور
  void togglePasswordVisibility() {
    isPasswordShow = !isPasswordShow;
    emit(SignupIsPasswordVisible(isPasswordShow));
  }


}


//  void clearForm() {
//     _usernameController.clear();
//     _emailController.clear();
//     _passwordController.clear();
//     _confirmPasswordController.clear();
//     _mobileController.clear();
//     _formKey.currentState?.reset();
//   }

//   @override
//   void dispose() {
//     _usernameController.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//     _confirmPasswordController.dispose();
//     _mobileController.dispose();
//     super.dispose();
//   }


