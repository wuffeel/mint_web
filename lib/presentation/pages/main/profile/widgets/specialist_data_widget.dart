import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mint_core/mint_core.dart';
import 'package:mint_core/mint_utils.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../../gen/colors.gen.dart';
import '../../../../../l10n/l10n.dart';
import '../../../../../theme/mint_text_styles.dart';
import '../../../../bloc/specialist_info/specialist_info_bloc.dart';
import '../../../../bloc/user/user_bloc.dart';

class SpecialistDataWidget extends StatelessWidget {
  const SpecialistDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpecialistInfoBloc, SpecialistInfoState>(
      builder: (context, state) {
        if (state is SpecialistInfoLoading) {
          return const _SpecialistDataBlockContainer(
            child: Center(child: CircularProgressIndicator()),
          );
        }
        if (state is SpecialistInfoFetchSuccess) {
          final specialist = state.specialist;
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _SpecialistPhoto(photoUrl: specialist.photoUrl),
              const SizedBox(width: 20),
              Expanded(
                child: SizedBox(
                  height: 250,
                  child: _SpecialistInfo(specialist: specialist),
                ),
              ),
            ],
          );
        }
        return const _SpecialistDataBlockContainer();
      },
    );
  }
}

class _SpecialistInfo extends StatelessWidget {
  const _SpecialistInfo({required this.specialist});

  final SpecialistModel specialist;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(flex: 2,child: _SpecialistHeaderData(specialist: specialist)),
        Expanded(flex: 3, child: _SpecialistPersonalData(specialist)),
      ],
    );
  }
}

class _SpecialistHeaderData extends StatelessWidget {
  const _SpecialistHeaderData({required this.specialist});

  final SpecialistModel specialist;

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
            InkWell(
              onTap: () {
                // TODO(wuffeel): add onEdit callback
              },
              child: const Icon(Icons.edit),
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


class _SpecialistPersonalData extends StatelessWidget {
  const _SpecialistPersonalData(this.specialist);

  final SpecialistModel specialist;

  List<_SpecialistPersonalDataItem> _items(
    BuildContext context,
    SpecialistModel specialist,
    UserModel? user,
  ) {
    final l10n = context.l10n;
    return <_SpecialistPersonalDataItem>[
      _SpecialistPersonalDataItem(
        title: l10n.specialities,
        value: specialist.specializations.join(', '),
        icon: Icons.psychology_outlined,
      ),
      _SpecialistPersonalDataItem(
        title: l10n.phone,
        value: user?.phoneNumber ?? '',
        icon: Icons.phone_outlined,
      ),
      _SpecialistPersonalDataItem(
        title: l10n.email,
        value: user?.email ?? '',
        icon: Icons.email_outlined,
      ),
      _SpecialistPersonalDataItem(
        title: l10n.experience,
        value: ExperienceLocalization.format(
          date: specialist.experience,
          locale: context.l10n.localeName,
        ),
        icon: Icons.work_outline_outlined,
      ),
      _SpecialistPersonalDataItem(
        title: l10n.price,
        value: '₴${specialist.price}',
        icon: Icons.monetization_on_outlined,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<UserBloc, UserState, UserModel?>(
      selector: (state) => state is UserAuthenticated ? state.user : null,
      builder: (context, user) {
        final items =
            _items(context, specialist, user).where((e) => e.value != '');
        return Row(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: items
                  .map(
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
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: items.map(
                (e) {
                  return Text(e.value, style: const TextStyle(fontSize: 16));
                },
              ).toList(),
            ),
          ],
        );
      },
    );
  }
}

class _SpecialistPhoto extends StatelessWidget {
  const _SpecialistPhoto({required this.photoUrl});

  final String? photoUrl;

  @override
  Widget build(BuildContext context) {
    final photoUrl = this.photoUrl;
    return Container(
      width: 200,
      height: 250,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Theme.of(context).scaffoldBackgroundColor,
        image: photoUrl != null
            ? DecorationImage(image: NetworkImage(photoUrl))
            : null,
      ),
      child: photoUrl == null
          ? Assets.svg.userPlaceholder.svg(
              width: 200,
              height: 250,
              fit: BoxFit.scaleDown,
              colorFilter: ColorFilter.mode(
                Theme.of(context).primaryColor,
                BlendMode.srcIn,
              ),
            )
          : null,
    );
  }
}

class _SpecialistDataBlockContainer extends StatelessWidget {
  const _SpecialistDataBlockContainer({this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: ColoredBox(color: Colors.white, child: child),
    );
  }
}

class _SpecialistPersonalDataItem {
  _SpecialistPersonalDataItem({
    required this.title,
    required this.value,
    this.icon,
  });

  final String title;
  final String value;
  final IconData? icon;
}
