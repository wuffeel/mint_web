import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/user/user_bloc.dart';
import '../widgets/error_try_again.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  void _fetchUser(BuildContext context) {
    context.read<UserBloc>().add(UserFetchRequested());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserFetchLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is UserFetchFailure) {
            return Center(
              child: ErrorTryAgain(onRefresh: () => _fetchUser(context)),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
