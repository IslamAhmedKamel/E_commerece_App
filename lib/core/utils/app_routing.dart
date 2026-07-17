import 'package:dio/dio.dart';
import 'package:e_commerece_app/core/api_service.dart';
import 'package:e_commerece_app/features/auth/data/auth_repo/auth_repo_implement.dart';
import 'package:e_commerece_app/features/auth/presentation/view_model/forgot_password/forgot_password_cubit.dart';
import 'package:e_commerece_app/features/auth/presentation/view_model/signin_cubit/signin_cubit.dart';
import 'package:e_commerece_app/features/auth/presentation/view_model/signup_cubit/signup_cubit.dart';
import 'package:e_commerece_app/features/auth/presentation/views/forgot_password_view.dart';
import 'package:e_commerece_app/features/auth/presentation/views/signin_view.dart';
import 'package:e_commerece_app/features/auth/presentation/views/signup_view.dart';
import 'package:e_commerece_app/features/home/data/home_repo/home_repo_impl.dart';
import 'package:e_commerece_app/features/home/presentation/home_view.dart';
import 'package:e_commerece_app/features/home/presentation/view_model/get_all_categories_cubit/get_all_categories_cubit.dart';
import 'package:e_commerece_app/features/home/presentation/view_model/get_all_products_cubit/get_all_products_cubit.dart';
import 'package:e_commerece_app/features/splash_feature.dart/presentation/views/onboarding_view.dart';
import 'package:e_commerece_app/features/splash_feature.dart/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouting {
  static const onBoardingPath = '/OnBoardingView';
  static const signInPath = '/signInPath';
  static const sinUpPath = '/sinUpPath';
  static const forgotPath = '/forgotPath';
  static const homePath = '/homePath';
  static GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: onBoardingPath,
        builder: (BuildContext context, GoRouterState state) {
          return const OnboardingView();
        },
      ),
      GoRoute(
        path: homePath,
        builder: (BuildContext context, GoRouterState state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create:(context) =>  GetAllCategoriesCubit(
                  homeRepo: HomeRepoImpl(apiService: ApiService(dio: Dio())),
                ),
              ),
              BlocProvider(
                create:(context) =>  GetAllProductsCubit(
                  homeRepo: HomeRepoImpl(apiService: ApiService(dio: Dio())),
                ),
              ),
            ],
            child: const HomeView(),
          );
        },
      ),
      GoRoute(
        path: signInPath,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (context) => SigninCubit(
              authRepo: AuthRepoImplement(apiService: ApiService(dio: Dio())),
            ),
            child: const SigninView(),
          );
        },
      ),
      GoRoute(
        path: sinUpPath,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => SignupCubit(
              authRepo: AuthRepoImplement(apiService: ApiService(dio: Dio())),
            ),
            child: SignupView(),
          );
        },
      ),

      GoRoute(
        path: forgotPath,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (context) => ForgotPasswordCubit(
              authRepo: AuthRepoImplement(apiService: ApiService(dio: Dio())),
            ),
            child: const ForgotPasswordView(),
          );
        },
      ),
    ],
  );
}
