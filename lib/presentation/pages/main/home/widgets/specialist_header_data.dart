import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mint_core/mint_core.dart';

import '../../../../../gen/colors.gen.dart';
import '../../../../../l10n/l10n.dart';
import '../../../../../theme/mint_text_styles.dart';
import '../../../../../utils/validation_util.dart';
import '../../../../bloc/specialist_profile/specialist_profile_bloc.dart';
import 'edit_text_field.dart';

class SpecialistHeaderData extends StatelessWidget {
  const SpecialistHeaderData({
    required this.specialist,
    required this.formKey,
    super.key,
  });

  final SpecialistModel specialist;
  final GlobalKey<FormState> formKey;

  SpecialistProfileBloc _profileBloc(BuildContext context) =>
      context.read<SpecialistProfileBloc>();

  void _onEdit(BuildContext context) {
    _profileBloc(context).add(SpecialistProfileEditRequested());
  }

  void _onCancel(BuildContext context) {
    _profileBloc(context).add(SpecialistProfileEditCancelRequested());
  }

  void _onSubmit(BuildContext context) {
    if (formKey.currentState?.validate() ?? false) {
      _profileBloc(context).add(SpecialistProfileUpdateRequested());
    }
  }

  void _onFirstNameChange(
    BuildContext context,
    String firstName,
    UserModel user,
  ) {
    final changeEvent = SpecialistProfileEditInfoChanged(
      specialist: specialist.copyWith(firstName: firstName),
      user: user.copyWith(firstName: firstName),
    );
    _profileBloc(context).add(changeEvent);
  }

  void _onLastNameChange(
    BuildContext context,
    String lastName,
    UserModel user,
  ) {
    final changeEvent = SpecialistProfileEditInfoChanged(
      specialist: specialist.copyWith(lastName: lastName),
      user: user.copyWith(lastName: lastName),
    );
    _profileBloc(context).add(changeEvent);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocBuilder<SpecialistProfileBloc, SpecialistProfileState>(
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if (state is! SpecialistProfileEditState)
                  Text(
                    specialist.fullName ?? l10n.specialist,
                    style: MintTextStyles.headline1,
                  )
                else
                  Column(
                    children: <Widget>[
                      _NameTextField(
                        initialValue: state.specialist.firstName,
                        onChanged: (name) =>
                            _onFirstNameChange(context, name, state.user),
                      ),
                      const SizedBox(height: 8),
                      _NameTextField(
                        initialValue: state.specialist.lastName,
                        onChanged: (name) =>
                            _onLastNameChange(context, name, state.user),
                      ),
                    ],
                  ),
                if (state is! SpecialistProfileEditState)
                  _HeaderIcon(
                    icon: Icons.edit,
                    iconColor: Theme.of(context).colorScheme.primary,
                    onTap: () => _onEdit(context),
                  )
                else
                  Row(
                    children: <Widget>[
                      _HeaderIcon(
                        icon: Icons.cancel_outlined,
                        iconColor: MintColors.errorColor.withOpacity(0.8),
                        iconSize: 28,
                        onTap: () => _onCancel(context),
                      ),
                      const SizedBox(width: 8),
                      if (state is! SpecialistProfileUpdateLoading)
                        _HeaderIcon(
                          icon: Icons.check_circle_outline,
                          iconColor: Theme.of(context).colorScheme.primary,
                          iconSize: 28,
                          onTap: () => _onSubmit(context),
                        )
                      else
                        const SizedBox(
                          width: 28,
                          height: 28,
                          child: CircularProgressIndicator(),
                        ),
                    ],
                  ),
              ],
            ),
            if (state is! SpecialistProfileEditState)
              Text(
                l10n.online,
                style: MintTextStyles.medium16.copyWith(
                  color: MintColors.primaryBlueColor,
                ),
              ),
            const SizedBox(height: 20),
            Divider(color: MintColors.hintColor.withOpacity(0.3)),
          ],
        );
      },
    );
  }
}

class _NameTextField extends StatelessWidget {
  const _NameTextField({required this.initialValue, required this.onChanged});

  final String? initialValue;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: EditTextField(
        initialValue: initialValue,
        style: MintTextStyles.headline1,
        onChanged: onChanged,
        validator: (value) => ValidationUtil.emptyValidator(context, value),
      ),
    );
  }
}

class _HeaderIcon extends StatelessWidget {
  const _HeaderIcon({
    required this.icon,
    required this.onTap,
    this.iconColor,
    this.iconSize,
  });

  final IconData icon;
  final VoidCallback onTap;
  final Color? iconColor;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Icon(icon, color: iconColor, size: iconSize),
        ),
      ),
    );
  }
}
