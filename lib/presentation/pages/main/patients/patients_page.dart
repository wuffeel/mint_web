import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entity/patient_filter.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../injector/injector.dart';
import '../../../../l10n/l10n.dart';
import '../../../../theme/mint_text_styles.dart';
import '../../../../utils/date_time_utils.dart';
import '../../../bloc/patients/patients_bloc.dart';
import 'widgets/patients_filter_dialog.dart';
import 'widgets/patients_paginated_data_table.dart';

@RoutePage()
class PatientsPage extends StatelessWidget {
  const PatientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<PatientsBloc>()..add(PatientsFetchBookListRequested()),
      child: const _PatientsView(),
    );
  }
}

class _PatientsView extends StatelessWidget {
  const _PatientsView();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.83,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 36),
              _PatientsToolbar(),
              SizedBox(height: 16),
              Flexible(child: PatientsPaginatedDataTable()),
              SizedBox(height: 65),
            ],
          ),
        ),
      ),
    );
  }
}

class _PatientsToolbar extends StatelessWidget {
  const _PatientsToolbar();

  void _showFilterDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (dialogContext) => BlocProvider.value(
        value: context.read<PatientsBloc>(),
        child: BlocBuilder<PatientsBloc, PatientsState>(
          builder: (context, state) {
            if (state is PatientsBookListLoadSuccess) {
              return PatientsFilterDialog(
                filter: state.filter,
                minDate: state.minBookTime,
                maxDate: state.maxBookTime,
                onApply: (filter) =>
                    _onFilterApply(context, dialogContext, filter),
                onClear: () => _onFilterClear(context, dialogContext),
                selectableDatePredicate: (date) => state.bookList.any(
                  (book) => DateTimeUtils.isSameDay(date, book.bookTime),
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  void _onFilterApply(
    BuildContext context,
    BuildContext dialogContext,
    PatientFilter filter,
  ) {
    context.read<PatientsBloc>().add(PatientsFilterChanged(filter));
    dialogContext.router.pop();
  }

  void _onFilterClear(BuildContext context, BuildContext dialogContext) {
    context
        .read<PatientsBloc>()
        .add(PatientsFilterChanged(PatientFilter.empty));
    dialogContext.router.pop();
  }

  void _onSearch(BuildContext context, String searchText) {
    context
        .read<PatientsBloc>()
        .add(PatientsFilterChanged(PatientFilter(searchText: searchText)));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          l10n.patientsList,
          style: MintTextStyles.body.copyWith(fontSize: 24),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              width: 200,
              child: TextField(
                decoration: InputDecoration(
                  hintText: l10n.search,
                  prefixIcon: const Icon(Icons.search),
                ),
                onChanged: (search) => _onSearch(context, search),
              ),
            ),
            const SizedBox(width: 24),
            InkWell(
              onTap: () => _showFilterDialog(context),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Assets.svg.filterIcon.svg(
                        width: 16,
                        height: 16,
                        fit: BoxFit.scaleDown,
                        colorFilter: ColorFilter.mode(
                          Theme.of(context).iconTheme.color ?? Colors.black,
                          BlendMode.srcIn,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(l10n.filter, style: MintTextStyles.tagBig),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
