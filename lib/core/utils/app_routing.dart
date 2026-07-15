import 'package:e_commerece_app/features/auth/presentation/views/signup_view.dart';
import 'package:e_commerece_app/features/splash_feature.dart/presentation/views/onboarding_view.dart';
import 'package:flutter/material.dart';
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
          return const SignupView();
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
      // GoRoute(
      //   path: signInPath,
      //   builder: (BuildContext context, GoRouterState state) {
      //     return BlocProvider(
      //       create: (context) => SignInCubit(),
      //       child: const SigninView(),
      //     );
      //   },
      // ),
      GoRoute(
        path: sinUpPath,
        builder: (context, state) {
          return SignupView();
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
