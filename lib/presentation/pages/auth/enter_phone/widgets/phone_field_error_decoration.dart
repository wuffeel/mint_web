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

  String _getFailureMessage(
    BuildContext context,
    AuthVerifyPhoneFailure state,
  ) {
    final l10n = context.l10n;
    return switch (state) {
      AuthVerifyPhoneBaseFailure() =>
        '${l10n.somethingWentWrong} ${l10n.tryAgain.toLowerCase()}',
      AuthVerifyPhoneInvalidNumber() => l10n.invalidPhoneNumber,
      AuthVerifyPhoneTooManyRequests() => l10n.tooManyRequestsTryAgainLater,
      AuthVerifyPhoneFailure() => l10n.phoneNumberAssociatedWithOtherUser,
    };
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthVerifyPhoneFailure) {
          return TextFieldErrorDecoration(
            errorText: _getFailureMessage(context, state),
            borderRadius: borderRadius,
            child: child,
          );
        }
        return child;
      },
    );
  }
}
