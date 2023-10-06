import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mint_core/mint_core.dart';

import '../../../../../gen/colors.gen.dart';
import '../../../../../l10n/l10n.dart';
import '../../../../../theme/mint_text_styles.dart';
import '../../../../bloc/specialist_profile/specialist_profile_bloc.dart';

class SpecialistHeaderData extends StatelessWidget {
  const SpecialistHeaderData({required this.specialist, super.key});

  final SpecialistModel specialist;

  void _onEdit(BuildContext context) {
    context.read<SpecialistProfileBloc>().add(SpecialistProfileEditRequested());
  }

  void _onCancel(BuildContext context) {
    context
        .read<SpecialistProfileBloc>()
        .add(SpecialistProfileEditCancelRequested());
  }

  void _onSubmit(BuildContext context) {
    context
        .read<SpecialistProfileBloc>()
        .add(SpecialistProfileUpdateRequested());
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              specialist.fullName ?? l10n.specialist,
              style: MintTextStyles.headline1,
            ),
            BlocSelector<SpecialistProfileBloc, SpecialistProfileState,
                SpecialistProfileEditState?>(
              selector: (state) =>
                  state is SpecialistProfileEditState ? state : null,
              builder: (context, state) {
                if (state == null) {
                  return _HeaderIcon(
                    icon: Icons.edit,
                    iconColor: Theme.of(context).colorScheme.primary,
                    onTap: () => _onEdit(context),
                  );
                }

                return Row(
                  children: <Widget>[
                    _HeaderIcon(
                      icon: Icons.check_circle_outline,
                      iconColor: Theme.of(context).colorScheme.primary,
                      onTap: () => _onSubmit(context),
                    ),
                    const SizedBox(width: 8),
                    _HeaderIcon(
                      icon: Icons.cancel_outlined,
                      iconColor: MintColors.errorColor,
                      onTap: () => _onCancel(context),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
        Text(
          l10n.online,
          style: MintTextStyles.medium16.copyWith(
            color: MintColors.primaryBlueColor,
          ),
        ),
        Divider(color: MintColors.hintColor.withOpacity(0.3)),
      ],
    );
  }
}

class _HeaderIcon extends StatelessWidget {
  const _HeaderIcon({required this.icon, required this.onTap, this.iconColor});

  final IconData icon;
  final VoidCallback onTap;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Icon(icon, color: iconColor),
        ),
      ),
    );
  }
}
