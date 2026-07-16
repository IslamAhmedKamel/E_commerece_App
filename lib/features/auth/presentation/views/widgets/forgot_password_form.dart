import 'package:e_commerece_app/features/auth/presentation/view_model/forgot_password/forgot_password_cubit.dart';
import 'package:e_commerece_app/features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordForm extends StatelessWidget {
  const ForgotPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: BlocProvider.of<ForgotPasswordCubit>(context).formKey,
      child: CustomTextField(
        controller:  BlocProvider.of<ForgotPasswordCubit>(context).emailController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your email';
          }
          // تحقق من صحة البريد الإلكتروني
          final emailRegex = RegExp(
            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
          );
          if (!emailRegex.hasMatch(value)) {
            return 'Please enter a valid email address';
          }
          return null;
        },
        hintText: "Enter your email address",
        prefixIcon: Icon(Icons.email),
      ),
    );
  }
}
