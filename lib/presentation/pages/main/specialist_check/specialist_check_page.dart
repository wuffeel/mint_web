import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injector/injector.dart';
import '../../../../router/app_router.gr.dart';
import '../../../bloc/specialist_info/specialist_info_bloc.dart';
import '../../../bloc/user/user_bloc.dart';

@RoutePage()
class SpecialistCheckPage extends AutoRouter with AutoRouteWrapper {
  const SpecialistCheckPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<SpecialistInfoBloc>()
            ..add(SpecialistInfoInitializeRequested())
            ..add(SpecialistInfoFetchRequested()),
        ),
        BlocProvider(
          create: (context) => getIt<UserBloc>()
            ..add(UserInitializeRequested())
            ..add(UserFetchRequested()),
        )
      ],
      child: BlocListener<SpecialistInfoBloc, SpecialistInfoState>(
        listener: (context, state) {
          if (state is SpecialistInfoFetchSuccess) {
            context.router.replace(const MainWrapperRoute());
          }
        },
        child: this,
      ),
    );
  }
}
