import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mint_core/mint_core.dart';

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
    final l10n = context.l10n;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 10),
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
        const SizedBox(height: 20),
        Text(
          (specialist.isOnline ?? true) ? l10n.online : l10n.offline,
          style: MintTextStyles.medium16.copyWith(
            color: MintColors.primaryBlueColor,
          ),
        ),
        const SizedBox(height: 24),
        Divider(color: MintColors.hintColor.withOpacity(0.3)),
        const SizedBox(height: 24),
        Expanded(child: _SpecialistPersonalData(specialist)),
      ],
    );
  }
}

class _SpecialistPersonalData extends StatelessWidget {
  const _SpecialistPersonalData(this.specialist);

  final SpecialistModel specialist;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Specialities:', style: MintTextStyles.medium16),
            Text('Phone:', style: MintTextStyles.medium16),
            Text('E-mail:', style: MintTextStyles.medium16),
            Text('Experience:', style: MintTextStyles.medium16),
          ],
        ),
        const SizedBox(width: 100),
        BlocSelector<UserBloc, UserState, UserModel?>(
          selector: (state) => state is UserAuthenticated ? state.user : null,
          builder: (context, user) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  specialist.specializations.toString(),
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  user?.phoneNumber ?? '',
                  style: const TextStyle(fontSize: 16),
                ),
                Text(user?.email ?? '', style: const TextStyle(fontSize: 16)),
                Text(
                    (DateTime.now().difference(specialist.experience).inDays /
                        365).toString(),
                    style: const TextStyle(fontSize: 16)),
              ],
            );
          },
        ),
      ],
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
