import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../injector/injector.dart';
import '../../../router/app_router.gr.dart';
import '../../bloc/user/user_bloc.dart';

@RoutePage()
class MainWrapperPage extends AutoRouter with AutoRouteWrapper {
  const MainWrapperPage({super.key});

  void _logOutListener(BuildContext context, UserState state) {
    if (state is UserUnauthenticated) {
      context.router.replace(const AuthWrapperRoute());
    }
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<UserBloc>()..add(UserInitializeRequested()),
      child: BlocListener<UserBloc, UserState>(
        listener: _logOutListener,
        child: this,
      ),
    );
  }
}