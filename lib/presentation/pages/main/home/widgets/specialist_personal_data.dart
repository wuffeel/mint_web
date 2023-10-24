import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mint_core/mint_core.dart';
import 'package:mint_core/mint_utils.dart';

import '../../../../../backbone/specialist_info_group.dart';
import '../../../../../l10n/l10n.dart';
import '../../../../../theme/mint_text_styles.dart';
import '../../../../bloc/user/user_bloc.dart';

class SpecialistPersonalData extends StatelessWidget {
  const SpecialistPersonalData({
    required this.specialist,
    required this.valueBuilder,
    super.key,
  });

  final SpecialistModel specialist;
  final Widget Function(
    BuildContext context,
    SpecialistInfoGroup infoEnum,
    SpecialistModel specialist,
    UserModel? user,
  ) valueBuilder;

  List<_SpecialistPersonalDataItem> _items(
    BuildContext context,
    SpecialistModel specialist,
    UserModel? user,
  ) {
    final l10n = context.l10n;
    return SpecialistInfoGroup.values
        .map(
          (info) => switch (info) {
            SpecialistInfoGroup.specialities => _SpecialistPersonalDataItem(
                info,
                title: l10n.specialities,
                value: valueBuilder(context, info, specialist, user),
                icon: Icons.psychology_outlined,
                maxLines: 2,
              ),
            SpecialistInfoGroup.phone => _SpecialistPersonalDataItem(
                info,
                title: l10n.phone,
                value: valueBuilder(context, info, specialist, user),
                icon: Icons.phone_outlined,
              ),
            SpecialistInfoGroup.email => _SpecialistPersonalDataItem(
                info,
                title: l10n.email,
                value: valueBuilder(context, info, specialist, user),
                icon: Icons.email_outlined,
              ),
            SpecialistInfoGroup.dateOfBirth => _SpecialistPersonalDataItem(
              info,
              title: l10n.dateOfBirth,
              value: valueBuilder(context, info, specialist, user),
              icon: Icons.calendar_today_outlined,
            ),
            SpecialistInfoGroup.experience => _SpecialistPersonalDataItem(
                info,
                title: l10n.experience,
                value: valueBuilder(context, info, specialist, user),
                icon: Icons.work_outline_outlined,
              ),
            SpecialistInfoGroup.price => _SpecialistPersonalDataItem(
                info,
                title: l10n.price,
                value: valueBuilder(context, info, specialist, user),
                icon: Icons.monetization_on_outlined,
              ),
          },
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<UserBloc, UserState, UserModel?>(
      selector: (state) => state is UserAuthenticated ? state.user : null,
      builder: (context, user) {
        final items = _items(context, specialist, user);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: items
              .map<Widget>(
                (e) => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    if (e.icon != null) ...[
                      Icon(
                        e.icon,
                        color: Theme.of(context).colorScheme.primary,
                        size: 18,
                      ),
                      const SizedBox(width: 8),
                    ],
                    SizedBox(
                      width: 120,
                      child: Text(
                        '${e.title}:',
                        style: MintTextStyles.medium16,
                      ),
                    ),
                    Flexible(child: e.value),
                  ],
                ),
              )
              .toList()..insertBetween(const SizedBox(height: 15)),
        );
      },
    );
  }
}

class _SpecialistPersonalDataItem {
  _SpecialistPersonalDataItem(
    this.infoEnum, {
    required this.title,
    required this.value,
    this.icon,
    this.maxLines = 1,
  });

  final SpecialistInfoGroup infoEnum;
  final String title;
  final Widget value;
  final IconData? icon;
  final int maxLines;
}
