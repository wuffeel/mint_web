import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../injector/injector.dart';
import '../../../router/app_router.gr.dart';
import '../../bloc/specialist_info/specialist_info_bloc.dart';
import '../../bloc/user/user_bloc.dart';

@RoutePage()
class MainWrapperPage extends AutoRouter with AutoRouteWrapper {
  const MainWrapperPage({super.key});

  void _logOutListener(BuildContext context, UserState state) {
    if (state is UserUnauthenticated) {
      context.router.replace(const AuthWrapperRoute());
    }
  }

  void _specialistInfoListener(
    BuildContext context,
    SpecialistInfoState state,
  ) {
    if (state is SpecialistInfoFetchSuccess) {
      context.router.navigate(const HomeRoute());
    }
    if (state is SpecialistInfoNotFound) {
      context.router.navigate(const OnboardingRoute());
    }
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<UserBloc>()
            ..add(UserInitializeRequested())
            ..add(UserFetchRequested()),
        ),
        BlocProvider(
          create: (context) => getIt<SpecialistInfoBloc>()
            ..add(SpecialistInfoInitializeRequested())
            ..add(SpecialistInfoFetchRequested()),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<UserBloc, UserState>(listener: _logOutListener),
          BlocListener<SpecialistInfoBloc, SpecialistInfoState>(
            listener: _specialistInfoListener,
          ),
        ],
        child: this,
      ),
    );
  }
}
