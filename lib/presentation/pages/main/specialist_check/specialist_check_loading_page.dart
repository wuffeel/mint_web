import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../router/app_router.gr.dart';
import '../../../bloc/specialist_info/specialist_info_bloc.dart';

@RoutePage()
class SpecialistCheckLoadingPage extends StatelessWidget {
  const SpecialistCheckLoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SpecialistInfoBloc, SpecialistInfoState>(
        listener: (context, state) {
          if (state is SpecialistInfoNotFound) {
            context.router.replace(const OnboardingRoute());
          }
        },
        builder: (context, state) {
          if (state is SpecialistInfoLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
