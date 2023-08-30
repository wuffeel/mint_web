import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_formatter/formatters/phone_input_formatter.dart';
import 'package:intl/intl.dart';

import '../../../../../domain/entity/user_model/user_model.dart';
import '../../../../../l10n/l10n.dart';
import '../../../../../theme/mint_text_styles.dart';
import '../../../../bloc/user/user_bloc.dart';
import '../../../../widgets/form_field_container.dart';
import 'onboarding_page_container.dart';

class BasicInfoWidget extends StatefulWidget {
  const BasicInfoWidget({
    required this.onNext,
    required this.userInfo,
    required this.onDataChange,
    super.key,
  });

  final VoidCallback onNext;
  final UserModel userInfo;
  final void Function(UserModel) onDataChange;

  @override
  State<BasicInfoWidget> createState() => _BasicInfoWidgetState();
}

class _BasicInfoWidgetState extends State<BasicInfoWidget> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final onDataChange = widget.onDataChange;
    final userInfo = widget.userInfo;
    return OnboardingPageContainer(
      title: l10n.basicInformation,
      subTitle: l10n.letsGiveYourPatientsBetterSense,
      onNext: widget.onNext,
      forceBackButton: false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(hintText: l10n.firstName),
            initialValue: userInfo.firstName,
            onChanged: (firstName) => onDataChange(
              userInfo.copyWith(firstName: firstName),
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: InputDecoration(hintText: l10n.lastName),
            initialValue: userInfo.lastName,
            onChanged: (lastName) => onDataChange(
              userInfo.copyWith(lastName: lastName),
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: InputDecoration(hintText: l10n.email),
            initialValue: userInfo.email,
            onChanged: (email) => onDataChange(
              userInfo.copyWith(email: email),
            ),
          ),
          const SizedBox(height: 16),
          const _PhoneNumberField(),
          const SizedBox(height: 16),
          _DateOfBirthField(
            dateOfBirth: userInfo.dateOfBirth,
            onDateChange: (date) => onDataChange(
              userInfo.copyWith(dateOfBirth: date),
            ),
          ),
        ],
      ),
    );
  }
}

class _PhoneNumberField extends StatelessWidget {
  const _PhoneNumberField();

  String _formattedPhone(String phoneNumber) {
    return formatAsPhoneNumber(phoneNumber) ?? phoneNumber;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserAuthenticated) {
          final phone = state.user.phoneNumber;
          return FormFieldContainer(
            child: SizedBox(
              width: double.infinity,
              child: Text(
                phone != null ? _formattedPhone(phone) : '',
                style: MintTextStyles.body,
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class _DateOfBirthField extends StatelessWidget {
  const _DateOfBirthField({
    required this.dateOfBirth,
    required this.onDateChange,
  });

  final DateTime? dateOfBirth;
  final void Function(DateTime) onDateChange;

  Future<DateTime?> _showDatePicker(BuildContext context) {
    final now = DateTime.now();
    return showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(now.year - 65),
      lastDate: now,
    );
  }

  @override
  Widget build(BuildContext context) {
    final date = dateOfBirth;
    return InkWell(
      onTap: () async {
        final date = await _showDatePicker(context);
        if (date == null) return;
        onDateChange(date);
      },
      child: FormFieldContainer(
        child: SizedBox(
          width: double.infinity,
          child: Text(
            date != null
                ? DateFormat.yMd(context.l10n.localeName).format(date)
                : context.l10n.dateOfBirth,
            style: MintTextStyles.body.copyWith(
              color: dateOfBirth == null
                  ? Theme.of(context).hintColor.withOpacity(0.3)
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}
