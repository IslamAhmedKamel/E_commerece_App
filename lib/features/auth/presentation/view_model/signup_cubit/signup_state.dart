part of 'signup_cubit.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}

final class SignupLoading extends SignupState {}

class SignupIsPasswordVisible extends SignupState {
  final bool isPasswordVisible;
  SignupIsPasswordVisible(this.isPasswordVisible);
}

final class SignupFailure extends SignupState {
  final String errMessage;

  SignupFailure({required this.errMessage});
}

final class SignupSuccess extends SignupState {}
