import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../l10n/l10n.dart';
import '../../../../bloc/auth/auth_bloc.dart';
import '../../../../widgets/text_field_error_decoration.dart';

class PhoneFieldErrorDecoration extends StatelessWidget {
  const PhoneFieldErrorDecoration({
    required this.child,
    super.key,
    this.borderRadius,
  });

  final Widget child;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthVerifyPhoneInvalidNumber) {
          return TextFieldErrorDecoration(
            errorText: l10n.invalidPhoneNumber,
            borderRadius: borderRadius,
            child: child,
          );
        }
        if (state is AuthVerifyPhoneTooManyRequests) {
          return TextFieldErrorDecoration(
            errorText: l10n.tooManyRequestsTryAgainLater,
            borderRadius: borderRadius,
            child: child,
          );
        }
        return child;
      },
    );
  }
}
