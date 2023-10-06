import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mint_core/mint_core.dart';
import 'package:mint_core/mint_utils.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../../l10n/l10n.dart';
import '../../../../bloc/specialist_info/specialist_info_bloc.dart';
import '../../../../bloc/specialist_profile/specialist_profile_bloc.dart';
import 'specialist_edit_widget.dart';
import 'specialist_header_data.dart';
import 'specialist_personal_data.dart';

class SpecialistDataWidget extends StatelessWidget {
  const SpecialistDataWidget({super.key});

  Widget _specialistInfoBuilder(
    BuildContext context,
    SpecialistInfoEnum info,
    SpecialistModel specialist,
    UserModel? user,
  ) {
    return Text(
      switch (info) {
        SpecialistInfoEnum.specialities =>
          specialist.specializations.join(', '),
        SpecialistInfoEnum.phone => user?.phoneNumber ?? '',
        SpecialistInfoEnum.email => user?.email ?? '',
        SpecialistInfoEnum.experience => _experienceInfo(context, specialist),
        SpecialistInfoEnum.price => '₴${specialist.price}',
      },
      style: const TextStyle(fontSize: 16),
    );
  }

  String _experienceInfo(BuildContext context, SpecialistModel specialist) {
    final l10n = context.l10n;
    final experienceDate =
        DateFormat.yMd(l10n.localeName).format(specialist.experience);
    final experienceYears = ExperienceLocalization.format(
      date: specialist.experience,
      locale: l10n.localeName,
    );
    return '$experienceDate - $experienceYears';
  }

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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: SpecialistHeaderData(specialist: specialist),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      flex: 4,
                      child: BlocSelector<SpecialistProfileBloc,
                          SpecialistProfileState, SpecialistProfileEditState?>(
                        selector: (state) =>
                            state is SpecialistProfileEditState ? state : null,
                        builder: (context, editState) {
                          if (editState == null) {
                            return SpecialistPersonalData(
                              specialist: specialist,
                              valueBuilder: _specialistInfoBuilder,
                            );
                          }
                          return SpecialistPersonalData(
                            specialist: specialist,
                            valueBuilder: (_, info, __, ___) {
                              return SpecialistEditWidget(
                                info,
                                specialist: editState.specialist,
                                user: editState.user,
                                specializations:
                                    editState.availableSpecializations,
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
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
            ? DecorationImage(image: NetworkImage(photoUrl), fit: BoxFit.cover)
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
      height: 300,
      width: double.infinity,
      child: ColoredBox(color: Colors.white, child: child),
    );
  }
}
