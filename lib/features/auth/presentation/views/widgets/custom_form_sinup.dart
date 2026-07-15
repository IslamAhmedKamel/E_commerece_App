import 'package:e_commerece_app/core/utils/app_colors.dart';
import 'package:e_commerece_app/features/auth/presentation/view_model/signup_cubit/signup_cubit.dart';
import 'package:e_commerece_app/features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';

class CustomFormSinup extends StatelessWidget {
  const CustomFormSinup({super.key});
  @override
  Widget build(BuildContext context) {
    var signUp = context.read<SignupCubit>();
    return Form(
      key: signUp.formKey,
      child: Column(
        children: [
          // حقل اسم المستخدم
          CustomTextField(
            controller: signUp.nameController,
            hintText: "Username",
            prefixIcon: const Icon(Icons.person),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your username';
              }
              if (value.length < 3) {
                return 'Username must be at least 3 characters';
              }
              if (value.length > 20) {
                return 'Username must be less than 20 characters';
              }
              if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(value)) {
                return 'Username can only contain letters, numbers, and underscores';
              }
              return null;
            },
          ),
          const Gap(16),

          // حقل البريد الإلكتروني
          CustomTextField(
            controller: signUp.emailController,
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
            controller: signUp.passwordController,
            hintText: "Password",
            obscureText: signUp.isPasswordShow,
            prefixIcon: const Icon(Icons.lock),
            suffixIcon: IconButton(
              icon: Icon(
                signUp.isPasswordShow ? Icons.visibility_off : Icons.visibility,
              ),
             
              onPressed: () {
                signUp.togglePasswordVisibility();
              },
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
          const Gap(16),

          // حقل تأكيد كلمة المرور
          CustomTextField(
            controller: signUp.rePasswordController,
            hintText: "Confirm Password",
            obscureText: signUp.isPasswordShow,
            prefixIcon: const Icon(Icons.lock_outline),
            suffixIcon: IconButton(
              icon: Icon(
                signUp.isPasswordShow ? Icons.visibility_off : Icons.visibility,
              ),
              onPressed: () {
                signUp.togglePasswordVisibility();
              },
              color: AppColors.greyHintTextFormColor,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please confirm your password';
              }
              if (value != signUp.passwordController.text) {
                return 'Passwords do not match';
              }
              return null;
            },
          ),
          const Gap(16),

          // حقل رقم الهاتف
          CustomTextField(
            controller: signUp.phoneController,
            prefixIcon: const Icon(Icons.phone_android),
            hintText: "Mobile",
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your mobile number';
              }
              // تحقق من رقم هاتف مصري
              if (!RegExp(r'^01[0-9]{9}$').hasMatch(value)) {
                return 'Please enter a valid Egyptian phone number (e.g., 01012345678)';
              }
              return null;
            },
          ),
          const Gap(24),

          // زر التسجيل
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                signUp.signUp();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
