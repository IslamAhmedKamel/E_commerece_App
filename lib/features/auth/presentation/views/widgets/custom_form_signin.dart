import 'package:e_commerece_app/core/utils/app_colors.dart';
import 'package:e_commerece_app/features/auth/presentation/view_model/signin_cubit/signin_cubit.dart';
import 'package:e_commerece_app/features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';

class CustomFormSignin extends StatelessWidget {
  const CustomFormSignin({super.key});

  @override
  Widget build(BuildContext context) {
    var signin = BlocProvider.of<SigninCubit>(context);
    return Form(
      key: signin.formKey,
      child: Column(
        children: [
          Column(
            children: [
              // حقل البريد الإلكتروني
              CustomTextField(
                controller: signin.emailController,
                hintText: "Email",
                keyboardType: TextInputType.emailAddress,
                prefixIcon: const Icon(Icons.email_rounded),
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
              ),
              const Gap(16),
              // حقل كلمة المرور
              CustomTextField(
                                controller: signin.passwordController,
                hintText: "Password",
                obscureText: !signin.isPasswordVisible,
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(
                    signin.isPasswordVisible
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                  onPressed: signin.togglePasswordVisibility,

                  color: AppColors.greyHintTextFormColor,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  if (value.length > 20) {
                    return 'Password must be less than 20 characters';
                  }
                  // تحقق من وجود حرف كبير
                  if (!RegExp(r'[A-Z]').hasMatch(value)) {
                    return 'Password must contain at least one uppercase letter';
                  }
                  // تحقق من وجود حرف صغير
                  if (!RegExp(r'[a-z]').hasMatch(value)) {
                    return 'Password must contain at least one lowercase letter';
                  }
                  // تحقق من وجود رقم
                  if (!RegExp(r'[0-9]').hasMatch(value)) {
                    return 'Password must contain at least one number';
                  }
                  // تحقق من وجود رمز خاص
                  if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
                    return 'Password must contain at least one special character';
                  }
                  return null;
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}



