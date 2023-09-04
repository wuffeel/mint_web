import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/specialist_info/specialist_info_bloc.dart';
import '../../../bloc/user/user_bloc.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SpecialistInfoBloc, SpecialistInfoState>(
        builder: (context, state) {
          if (state is SpecialistInfoLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is SpecialistInfoFetchSuccess) {
            return Center(
              child: FractionallySizedBox(
                widthFactor: 0.3,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(state.specialist.toString().split(',').join('\n')),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () =>
                          context.read<UserBloc>().add(UserLogOutRequested()),
                      child: const Text('Log out'),
                    )
                  ],
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
