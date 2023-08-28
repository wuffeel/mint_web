import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../injector/injector.dart';
import '../../router/app_router.gr.dart';
import '../bloc/user/user_bloc.dart';

@RoutePage()
class UserWrapperPage extends AutoRouter with AutoRouteWrapper {
  const UserWrapperPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<UserBloc>()..add(UserInitializeRequested()),
      child: BlocListener<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UserAuthenticated) {
            context.router.navigate(const HomePlaceholderRoute());
          }
          if (state is UserUnauthenticated) {
            context.router.navigate(const AuthWrapperRoute());
          }
        },
        child: this,
      ),
    );
  }
}
