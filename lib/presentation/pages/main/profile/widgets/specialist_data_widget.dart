import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mint_core/mint_core.dart';
import 'package:mint_core/mint_utils.dart';

import '../../../../../backbone/specialist_info_group.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../l10n/l10n.dart';
import '../../../../bloc/specialist_info/specialist_info_bloc.dart';
import '../../../../bloc/specialist_profile/specialist_profile_bloc.dart';
import 'specialist_edit_widget.dart';
import 'specialist_header_data.dart';
import 'specialist_personal_data.dart';

class SpecialistDataWidget extends StatefulWidget {
  const SpecialistDataWidget({super.key});

  @override
  State<SpecialistDataWidget> createState() => _SpecialistDataWidgetState();
}

class _SpecialistDataWidgetState extends State<SpecialistDataWidget> {
  final _formKey = GlobalKey<FormState>();

  Widget _specialistInfoBuilder(
    BuildContext context,
    SpecialistInfoGroup info,
    SpecialistModel specialist,
    UserModel? user,
  ) {
    final dateOfBirth = user?.dateOfBirth;
    return Text(
      switch (info) {
        SpecialistInfoGroup.specialities =>
          specialist.specializations.join(', '),
        SpecialistInfoGroup.phone => user?.phoneNumber ?? '',
        SpecialistInfoGroup.email => user?.email ?? '',
        SpecialistInfoGroup.dateOfBirth =>
          dateOfBirth != null ? DateFormat.yMMMMd().format(dateOfBirth) : '',
        SpecialistInfoGroup.experience => _experienceInfo(context, specialist),
        SpecialistInfoGroup.price => '₴${specialist.price}',
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
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SpecialistHeaderData(
                        specialist: specialist,
                        formKey: _formKey,
                      ),
                      const SizedBox(height: 20),
                      BlocSelector<SpecialistProfileBloc,
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
                                currentSpecializations:
                                    editState.currentSpecializations,
                                availableSpecializations:
                                    editState.availableSpecializations,
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
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

  Widget? _photoWidget(
    BuildContext context,
    SpecialistProfileEditState? state,
  ) {
    final photoUrl = this.photoUrl;
    final photoData = state?.photoData;
    if (photoData != null) {
      return Image.memory(
        photoData.bytes,
        alignment: Alignment.bottomCenter,
        fit: BoxFit.cover,
      );
    } else if (photoUrl != null) {
      return Image.network(
        photoUrl,
        alignment: Alignment.bottomCenter,
        fit: BoxFit.cover,
      );
    } else {
      return Assets.svg.userPlaceholder.svg(
        width: 200,
        height: 250,
        fit: BoxFit.scaleDown,
        colorFilter: ColorFilter.mode(
          Theme.of(context).primaryColor,
          BlendMode.srcIn,
        ),
      );
    }
  }

  void _onPickImage(BuildContext context) {
    context
        .read<SpecialistProfileBloc>()
        .add(SpecialistProfilePickImageRequested());
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
      width: 200,
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          BlocSelector<SpecialistProfileBloc, SpecialistProfileState,
              SpecialistProfileEditState?>(
            selector: (state) =>
                state is SpecialistProfileEditState ? state : null,
            builder: (context, state) {
              return Container(
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                child: _photoWidget(context, state),
              );
            },
          ),
          BlocSelector<SpecialistProfileBloc, SpecialistProfileState, bool>(
            selector: (state) => state is SpecialistProfileEditState,
            builder: (context, isEdit) {
              if (!isEdit) return const SizedBox.shrink();
              return Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: MaterialButton(
                    onPressed: () => _onPickImage(context),
                    minWidth: 50,
                    height: 50,
                    color: Colors.white,
                    shape: const CircleBorder(),
                    child: const Icon(Icons.add_a_photo_outlined),
                  ),
                ),
              );
            },
          ),
        ],
      ),
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
