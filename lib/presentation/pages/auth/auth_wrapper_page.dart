import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mint_core/mint_bloc.dart';

import '../../../gen/colors.gen.dart';
import '../../../injector/injector.dart';
import '../../../l10n/l10n.dart';
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

  void _googleAuthListener(BuildContext context, GoogleAuthState state) {
    if (state is GoogleAuthSignInSuccess) {
      context.read<UserBloc>().add(UserFetchRequested());
    }
    if (state is GoogleAuthSignInFailure) {
      final l10n = context.l10n;
      switch (state.failure) {
        case GoogleAuthFailure.base:
          _showErrorSnackBar(context, l10n.somethingWentWrong);
          break;
        case GoogleAuthFailure.wrongUserType:
          _showErrorSnackBar(context, l10n.accountIsAttachedToOtherUser);
          break;
      }
    }
  }

  void _showErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: const TextStyle(color: Colors.white)),
        backgroundColor: MintColors.errorColor,
      ),
    );
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
        BlocProvider(create: (context) => getIt<GoogleAuthBloc>()),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AuthBloc, AuthState>(listener: _otpVerificationListener),
          BlocListener<UserBloc, UserState>(listener: _userFetchListener),
          BlocListener<GoogleAuthBloc, GoogleAuthState>(
            listener: _googleAuthListener,
          ),
        ],
        child: this,
      ),
    );
  }
}
