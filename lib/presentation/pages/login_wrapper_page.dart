import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../injector/injector.dart';
import '../../router/app_router.gr.dart';
import '../bloc/user/user_bloc.dart';

@RoutePage()
class LoginWrapperPage extends AutoRouter with AutoRouteWrapper {
  const LoginWrapperPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<UserBloc>()
        ..add(UserInitializeRequested())
        ..add(UserFetchRequested()),
      child: BlocListener<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UserAuthenticated) {
            context.router.replace(const SpecialistCheckRoute());
          }
          if (state is UserUnauthenticated) {
            context.router.replaceAll([const AuthWrapperRoute()]);
          }
        },
        child: this,
      ),
    );
  }
}
