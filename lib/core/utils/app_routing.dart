import 'package:dio/dio.dart';
import 'package:e_commerece_app/core/api_service.dart';
import 'package:e_commerece_app/features/auth/data/auth_repo/auth_repo_implement.dart';
import 'package:e_commerece_app/features/auth/presentation/view_model/signin_cubit/signin_cubit.dart';
import 'package:e_commerece_app/features/auth/presentation/view_model/signup_cubit/signup_cubit.dart';
import 'package:e_commerece_app/features/auth/presentation/views/signin_view.dart';
import 'package:e_commerece_app/features/auth/presentation/views/signup_view.dart';
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
      // GoRoute(
      //   path: homePath,
      //   builder: (BuildContext context, GoRouterState state) {
      //     return const HomeView();
      //   },
      // ),
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

      // GoRoute(
      //   path: forgotPath,
      //   builder: (BuildContext context, GoRouterState state) {
      //     return BlocProvider(
      //       create: (context) => ForgotPasswordCubit(),
      //       child: const ForgotPasswordView(),
      //     );
      //   },
      // ),
    ],
  );
}
