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

  void _userBlocListener(BuildContext context, UserState state) {
    if (state is UserUnauthenticated) {
      context.router.markUrlStateForReplace();
      context.router.replaceAll([const AuthWrapperRoute()]);
    }
    if (state is UserAuthenticated) {
      context.read<SpecialistInfoBloc>().add(SpecialistInfoFetchRequested());
    }
  }

  void _specialistInfoBlocListener(
    BuildContext context,
    SpecialistInfoState state,
  ) {
    if (state is SpecialistInfoFetchSuccess) {
      if (!context.router.currentPath.startsWith('/main/navigation')) {
        context.router.navigate(const NavigationRoute());
      }
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
          create: (context) => getIt<SpecialistInfoBloc>()
            ..add(SpecialistInfoInitializeRequested()),
        ),
        BlocProvider(
          create: (context) => getIt<UserBloc>()
            ..add(UserInitializeRequested())
            ..add(UserFetchRequested())
            ..add(UserInitializePresenceRequested()),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<UserBloc, UserState>(listener: _userBlocListener),
          BlocListener<SpecialistInfoBloc, SpecialistInfoState>(
            listenWhen: (oldState, newState) =>
                oldState is! SpecialistInfoFetchSuccess,
            listener: _specialistInfoBlocListener,
          ),
        ],
        child: this,
      ),
    );
  }
}
