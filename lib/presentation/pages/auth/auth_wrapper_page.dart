import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../injector/injector.dart';
import '../../bloc/auth/auth_bloc.dart';
import '../../bloc/user/user_bloc.dart';

@RoutePage()
class AuthWrapperPage extends AutoRouter with AutoRouteWrapper {
  const AuthWrapperPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthBloc>(),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthVerifyOtpSuccess) {
            context.read<UserBloc>().add(UserFetchRequested());
          }
        },
        child: this,
      ),
    );
  }
}
