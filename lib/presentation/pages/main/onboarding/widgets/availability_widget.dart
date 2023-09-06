import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../backbone/work_day_validation_messages.dart';
import '../../../../../domain/entity/onboarding/onboarding.dart';
import '../../../../../l10n/l10n.dart';
import '../../../../../utils/date_time_utils.dart';
import '../../../../bloc/specialist/specialist_bloc.dart';
import 'availability_weekday_apply_dialog.dart';
import 'availability_weekday_list.dart';
import 'onboarding_page_container.dart';

class AvailabilityWidget extends StatefulWidget {
  const AvailabilityWidget(
    this.control,
    this.formControl, {
    required this.onBack,
    required this.onSubmit,
    required this.workDayFormList,
    required this.currentIndex,
    required this.onWorkDayIndexChange,
    super.key,
  });

  final VoidCallback onBack;
  final VoidCallback? onSubmit;
  final FormArray<Map<String, Object?>> control;
  final FormGroup formControl;
  final List<WorkDayInfoForm> workDayFormList;
  final int currentIndex;
  final void Function(int) onWorkDayIndexChange;

  @override
  State<AvailabilityWidget> createState() => _AvailabilityWidgetState();
}

class _AvailabilityWidgetState extends State<AvailabilityWidget> {
  /// ['Mon', 'Tue', ..., 'Sun']
  late final _shortWeekdays = DateTimeUtils.getShortWeekdays(
    locale: context.l10n.localeName,
  );

  void _showApplyForOtherDialog(TimeOfDay? startTime, TimeOfDay? endTime) {
    showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return AvailabilityWeekdayApplyDialog(
          startTime: startTime,
          endTime: endTime,
          shortWeekdays: _shortWeekdays,
          workDayFormList: widget.workDayFormList,
          currentIndex: widget.currentIndex,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    String required(Object error) => l10n.fieldIsRequired;
    final arrayControl = widget.control;
    final currentForm = widget.workDayFormList[widget.currentIndex];
    return ReactiveForm(
      key: ValueKey(widget.currentIndex),
      formGroup: widget.formControl,
      child: ReactiveFormConsumer(
        builder: (context, control, child) {
          return ReactiveWorkDayInfoForm(
            form: currentForm,
            child: ReactiveWorkDayInfoFormConsumer(
              builder: (context, form, child) {
                final startTime = form.startTimeControl?.value;
                final endTime = form.endTimeControl?.value;
                return OnboardingPageContainer(
                  title: l10n.yourAvailability,
                  subTitle: l10n.pleaseProvideYourGeneralAvailability,
                  onBack: widget.onBack,
                  hasCustomNextButton: true,
                  onNext: null,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      AvailabilityWeekdayList(
                        currentWeekday: widget.currentIndex,
                        shortWeekdays: _shortWeekdays,
                        onWeekdaySelect: widget.onWorkDayIndexChange,
                      ),
                      const SizedBox(height: 28),
                      _ReactiveTimePicker(
                        control: currentForm.startTimeControl,
                        hintText: l10n.startTime,
                        validationMessages: {
                          WorkDayValidationMessages.startRequired: required,
                          WorkDayValidationMessages.timeEqual: (error) =>
                              l10n.timeIsEqual,
                          WorkDayValidationMessages.lowDifference: (error) =>
                              l10n.differenceShouldBeMoreThan1Hour,
                        },
                      ),
                      const SizedBox(height: 16),
                      _ReactiveTimePicker(
                        control: currentForm.endTimeControl,
                        hintText: l10n.endTime,
                        validationMessages: {
                          WorkDayValidationMessages.endRequired: required,
                          WorkDayValidationMessages.timeEqual: (error) =>
                              l10n.timeIsEqual,
                          WorkDayValidationMessages.lowDifference: (error) =>
                              l10n.differenceShouldBeMoreThan1Hour,
                        },
                      ),
                      if (startTime != null || endTime != null) ...[
                        const SizedBox(height: 20),
                        TextButton(
                          onPressed: () => _showApplyForOtherDialog(
                            startTime,
                            endTime,
                          ),
                          child: Text(l10n.applyScheduleForOtherWeekdays),
                        ),
                      ],
                      const SizedBox(height: 50),
                      BlocBuilder<SpecialistBloc, SpecialistState>(
                        builder: (context, state) {
                          if (state is SpecialistAddNewLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return ElevatedButton(
                            onPressed: control.valid && arrayControl.valid
                                ? widget.onSubmit
                                : null,
                            child: Text(l10n.submit),
                          );
                        },
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class _ReactiveTimePicker extends StatelessWidget {
  const _ReactiveTimePicker({
    required this.control,
    required this.hintText,
    this.validationMessages,
  });

  final FormControl<TimeOfDay>? control;
  final Map<String, String Function(Object)>? validationMessages;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return ReactiveTimePicker(
      formControl: control,
      initialEntryMode: TimePickerEntryMode.input,
      builder: (context, picker, child) {
        return _AvailabilityTimePicker(
          control: picker.control,
          time: picker.value,
          hintText: hintText,
          onTap: picker.showPicker,
          validationMessages: validationMessages,
        );
      },
      transitionBuilder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child ?? Container(),
        );
      },
    );
  }
}

class _AvailabilityTimePicker extends StatefulWidget {
  const _AvailabilityTimePicker({
    required this.control,
    required this.time,
    required this.hintText,
    required this.onTap,
    required this.validationMessages,
  });

  final FormControl<TimeOfDay?>? control;
  final TimeOfDay? time;
  final String hintText;
  final VoidCallback onTap;
  final Map<String, String Function(Object)>? validationMessages;

  @override
  State<_AvailabilityTimePicker> createState() =>
      _AvailabilityTimePickerState();
}

class _AvailabilityTimePickerState extends State<_AvailabilityTimePicker> {
  final _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ReactiveTextField(
          key: ObjectKey(widget.control),
          enableInteractiveSelection: false,
          decoration: InputDecoration(hintText: widget.hintText),
          formControl: widget.control,
          onTap: (_) => widget.onTap(),
          readOnly: true,
          showCursor: false,
          valueAccessor: TimeOfDayValueAccessor(),
          validationMessages: widget.validationMessages,
        ),
        Positioned.fill(
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(onTap: widget.onTap),
          ),
        ),
        if (widget.control?.value != null)
          Positioned.fill(
            top: 12,
            right: 8,
            child: Align(
              alignment: Alignment.topRight,
              child: Material(
                child: InkWell(
                  onTap: () {
                    _focusNode
                      ..unfocus()
                      ..canRequestFocus = false;
                    widget.control?.updateValue(null);
                    Future.delayed(const Duration(milliseconds: 100), () {
                      _focusNode.canRequestFocus = true;
                    });
                  },
                  child: const Icon(Icons.clear),
                ),
              ),
            ),
          )
        else
          const SizedBox.shrink(),
      ],
    );
  }
}
