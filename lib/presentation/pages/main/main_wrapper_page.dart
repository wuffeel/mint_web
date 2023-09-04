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
      context.router.replace(const AuthWrapperRoute());
    }
    if (state is UserAuthenticated) {
      context.read<SpecialistInfoBloc>().add(SpecialistInfoFetchRequested());
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
            ..add(UserFetchRequested()),
        ),
      ],
      child: BlocListener<UserBloc, UserState>(
        listener: _userBlocListener,
        child: this,
      ),
    );
  }
}
