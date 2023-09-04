import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../injector/injector.dart';
import '../../../router/app_router.gr.dart';
import '../../bloc/auth/auth_bloc.dart';
import '../../bloc/user/user_bloc.dart';

@RoutePage()
class AuthWrapperPage extends AutoRouter with AutoRouteWrapper {
  const AuthWrapperPage({super.key});

  void _otpVerificationListener(BuildContext context, AuthState state) {
    if (state is AuthVerifyOtpSuccess) {
      context.read<UserBloc>().add(UserFetchRequested());
    }
  }

  void _userFetchListener(BuildContext context, UserState state) {
    if (state is UserAuthenticated) {
      context.router.markUrlStateForReplace();
      context.router.replace(const MainWrapperRoute());
    }
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<AuthBloc>()),
        BlocProvider(
          create: (context) =>
              getIt<UserBloc>()..add(UserInitializeRequested()),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AuthBloc, AuthState>(listener: _otpVerificationListener),
          BlocListener<UserBloc, UserState>(listener: _userFetchListener),
        ],
        child: this,
      ),
    );
  }
}
