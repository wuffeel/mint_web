import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mint_core/mint_core.dart';
import 'package:mint_core/mint_utils.dart';

import '../../../../../l10n/l10n.dart';
import '../../../../../theme/mint_text_styles.dart';
import '../../../../bloc/user/user_bloc.dart';

enum SpecialistInfoEnum {
  specialities,
  phone,
  email,
  experience,
  price,
}

class SpecialistPersonalData extends StatelessWidget {
  const SpecialistPersonalData({
    required this.specialist,
    required this.valueBuilder,
    super.key,
  });

  final SpecialistModel specialist;
  final Widget Function(
    BuildContext context,
    SpecialistInfoEnum infoEnum,
    SpecialistModel specialist,
    UserModel? user,
  ) valueBuilder;

  List<_SpecialistPersonalDataItem> _items(
    BuildContext context,
    SpecialistModel specialist,
    UserModel? user,
  ) {
    final l10n = context.l10n;
    return SpecialistInfoEnum.values
        .map(
          (info) => switch (info) {
            SpecialistInfoEnum.specialities => _SpecialistPersonalDataItem(
                info,
                title: l10n.specialities,
                value: valueBuilder(context, info, specialist, user),
                icon: Icons.psychology_outlined,
                maxLines: 2,
              ),
            SpecialistInfoEnum.phone => _SpecialistPersonalDataItem(
                info,
                title: l10n.phone,
                value: valueBuilder(context, info, specialist, user),
                icon: Icons.phone_outlined,
              ),
            SpecialistInfoEnum.email => _SpecialistPersonalDataItem(
                info,
                title: l10n.email,
                value: valueBuilder(context, info, specialist, user),
                icon: Icons.email_outlined,
              ),
            SpecialistInfoEnum.experience => _SpecialistPersonalDataItem(
                info,
                title: l10n.experience,
                value: valueBuilder(context, info, specialist, user),
                icon: Icons.work_outline_outlined,
              ),
            SpecialistInfoEnum.price => _SpecialistPersonalDataItem(
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

        return Row(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: items
                  .map<Widget>(
                    (e) => Row(
                      children: <Widget>[
                        if (e.icon != null) ...[
                          Icon(
                            e.icon,
                            color: Theme.of(context).colorScheme.primary,
                            size: 18,
                          ),
                          const SizedBox(width: 8),
                        ],
                        Text('${e.title}:', style: MintTextStyles.medium16),
                      ],
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(width: 100),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  items.length,
                  (index) => items[index].value,
                ),
              ),
            ),
          ],
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

  final SpecialistInfoEnum infoEnum;
  final String title;
  final Widget value;
  final IconData? icon;
  final int maxLines;
}
