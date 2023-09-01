// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file:

part of 'onboarding.dart';

// **************************************************************************
// ReactiveFormsGenerator
// **************************************************************************

class ReactiveOnboardingFormConsumer extends StatelessWidget {
  const ReactiveOnboardingFormConsumer({
    Key? key,
    required this.builder,
    this.child,
  }) : super(key: key);

  final Widget? child;

  final Widget Function(
      BuildContext context, OnboardingForm formModel, Widget? child) builder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveOnboardingForm.of(context);

    if (formModel is! OnboardingForm) {
      throw FormControlParentNotFoundException(this);
    }
    return builder(context, formModel, child);
  }
}

class OnboardingFormInheritedStreamer extends InheritedStreamer<dynamic> {
  const OnboardingFormInheritedStreamer({
    Key? key,
    required this.form,
    required Stream<dynamic> stream,
    required Widget child,
  }) : super(
          stream,
          child,
          key: key,
        );

  final OnboardingForm form;
}

class ReactiveOnboardingForm extends StatelessWidget {
  const ReactiveOnboardingForm({
    Key? key,
    required this.form,
    required this.child,
    this.onWillPop,
  }) : super(key: key);

  final Widget child;

  final OnboardingForm form;

  final WillPopCallback? onWillPop;

  static OnboardingForm? of(
    BuildContext context, {
    bool listen = true,
  }) {
    if (listen) {
      return context
          .dependOnInheritedWidgetOfExactType<OnboardingFormInheritedStreamer>()
          ?.form;
    }

    final element = context.getElementForInheritedWidgetOfExactType<
        OnboardingFormInheritedStreamer>();
    return element == null
        ? null
        : (element.widget as OnboardingFormInheritedStreamer).form;
  }

  @override
  Widget build(BuildContext context) {
    return OnboardingFormInheritedStreamer(
      form: form,
      stream: form.form.statusChanged,
      child: WillPopScope(
        onWillPop: onWillPop,
        child: child,
      ),
    );
  }
}

class OnboardingFormBuilder extends StatefulWidget {
  const OnboardingFormBuilder({
    Key? key,
    this.model,
    this.child,
    this.onWillPop,
    required this.builder,
    this.initState,
  }) : super(key: key);

  final Onboarding? model;

  final Widget? child;

  final WillPopCallback? onWillPop;

  final Widget Function(
      BuildContext context, OnboardingForm formModel, Widget? child) builder;

  final void Function(BuildContext context, OnboardingForm formModel)?
      initState;

  @override
  _OnboardingFormBuilderState createState() => _OnboardingFormBuilderState();
}

class _OnboardingFormBuilderState extends State<OnboardingFormBuilder> {
  late OnboardingForm _formModel;

  @override
  void initState() {
    _formModel =
        OnboardingForm(OnboardingForm.formElements(widget.model), null);

    if (_formModel.form.disabled) {
      _formModel.form.markAsDisabled();
    }

    widget.initState?.call(context, _formModel);

    super.initState();
  }

  @override
  void didUpdateWidget(covariant OnboardingFormBuilder oldWidget) {
    if (widget.model != oldWidget.model) {
      _formModel =
          OnboardingForm(OnboardingForm.formElements(widget.model), null);

      if (_formModel.form.disabled) {
        _formModel.form.markAsDisabled();
      }

      widget.initState?.call(context, _formModel);
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _formModel.form.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveOnboardingForm(
      key: ObjectKey(_formModel),
      form: _formModel,
      onWillPop: widget.onWillPop,
      child: ReactiveFormBuilder(
        form: () => _formModel.form,
        onWillPop: widget.onWillPop,
        builder: (context, formGroup, child) =>
            widget.builder(context, _formModel, widget.child),
        child: widget.child,
      ),
    );
  }
}

class OnboardingForm implements FormModel<Onboarding> {
  OnboardingForm(
    this.form,
    this.path,
  );

  static const String basicInfoControlName = "basicInfo";

  static const String specializationsControlName = "specializations";

  static const String experienceInfoControlName = "experienceInfo";

  static const String pricingControlName = "pricing";

  static const String availabilityControlName = "availability";

  final FormGroup form;

  final String? path;

  String specializationsControlPath() =>
      pathBuilder(specializationsControlName);
  String pricingControlPath() => pathBuilder(pricingControlName);
  String basicInfoControlPath() => pathBuilder(basicInfoControlName);
  String experienceInfoControlPath() => pathBuilder(experienceInfoControlName);
  String availabilityControlPath() => pathBuilder(availabilityControlName);
  List<String> get _specializationsValue =>
      specializationsControl.value as List<String>;
  int get _pricingValue => pricingControl.value as int;
  BasicInfo? get _basicInfoValue => basicInfoForm.model;
  ExperienceInfo? get _experienceInfoValue => experienceInfoForm.model;
  List<WorkDayInfo> get _availabilityValue =>
      availabilityWorkDayInfoForm.map((e) => e.model).toList();
  bool get containsSpecializations {
    try {
      form.control(specializationsControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsPricing {
    try {
      form.control(pricingControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsBasicInfo {
    try {
      form.control(basicInfoControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsExperienceInfo {
    try {
      form.control(experienceInfoControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsAvailability {
    try {
      form.control(availabilityControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  Object? get specializationsErrors => specializationsControl.errors;
  Object? get pricingErrors => pricingControl.errors;
  Object? get basicInfoErrors => basicInfoControl?.errors;
  Object? get experienceInfoErrors => experienceInfoControl?.errors;
  Object? get availabilityErrors => availabilityControl.errors;
  void get specializationsFocus => form.focus(specializationsControlPath());
  void get pricingFocus => form.focus(pricingControlPath());
  void get basicInfoFocus => form.focus(basicInfoControlPath());
  void get experienceInfoFocus => form.focus(experienceInfoControlPath());
  void get availabilityFocus => form.focus(availabilityControlPath());
  void basicInfoRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsBasicInfo) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          basicInfoControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            basicInfoControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void experienceInfoRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsExperienceInfo) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          experienceInfoControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            experienceInfoControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void specializationsValueUpdate(
    List<String> value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    specializationsControl.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void pricingValueUpdate(
    int value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    pricingControl.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void basicInfoValueUpdate(
    BasicInfo? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    basicInfoControl?.updateValue(BasicInfoForm.formElements(value).rawValue,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void experienceInfoValueUpdate(
    ExperienceInfo? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    experienceInfoControl?.updateValue(
        ExperienceInfoForm.formElements(value).rawValue,
        updateParent: updateParent,
        emitEvent: emitEvent);
  }

  void availabilityValueUpdate(
    List<WorkDayInfo> value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    final localValue = (value);
    if (localValue.isEmpty) {
      availabilityClear(updateParent: updateParent, emitEvent: emitEvent);

      return;
    }

    final toUpdate = <WorkDayInfo>[];
    final toAdd = <WorkDayInfo>[];

    localValue.asMap().forEach((k, v) {
      if (availabilityWorkDayInfoForm.asMap().containsKey(k) &&
          (availabilityControl.value ?? []).asMap().containsKey(k)) {
        toUpdate.add(v);
      } else {
        toAdd.add(v);
      }
    });

    if (toUpdate.isNotEmpty) {
      availabilityControl.updateValue(
          toUpdate
              .map((e) => WorkDayInfoForm.formElements(e).rawValue)
              .toList(),
          updateParent: updateParent,
          emitEvent: emitEvent);
    }

    if (toAdd.isNotEmpty) {
      toAdd.forEach((e) {
        availabilityControl.add(WorkDayInfoForm.formElements(e),
            updateParent: updateParent, emitEvent: emitEvent);
      });
    }
  }

  void availabilityInsert(
    int i,
    WorkDayInfo value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if ((availabilityControl.value ?? []).length < i) {
      addAvailabilityItem(value);
      return;
    }

    availabilityControl.insert(
      i,
      WorkDayInfoForm.formElements(value),
      updateParent: updateParent,
      emitEvent: emitEvent,
    );
  }

  void availabilityClear({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    availabilityWorkDayInfoForm.clear();
    availabilityControl.clear(updateParent: updateParent, emitEvent: emitEvent);
  }

  void specializationsValuePatch(
    List<String> value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    specializationsControl.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void pricingValuePatch(
    int value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    pricingControl.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void basicInfoValuePatch(
    BasicInfo? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    basicInfoControl?.updateValue(BasicInfoForm.formElements(value).rawValue,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void experienceInfoValuePatch(
    ExperienceInfo? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    experienceInfoControl?.updateValue(
        ExperienceInfoForm.formElements(value).rawValue,
        updateParent: updateParent,
        emitEvent: emitEvent);
  }

  void availabilityValuePatch(
    List<WorkDayInfo> value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    final keys = availabilityWorkDayInfoForm.asMap().keys;

    final toPatch = <WorkDayInfo>[];
    (value).asMap().forEach(
      (k, v) {
        if (keys.contains(k)) {
          toPatch.add(v);
        }
      },
    );

    availabilityControl.patchValue(
        toPatch.map((e) => WorkDayInfoForm.formElements(e).rawValue).toList(),
        updateParent: updateParent,
        emitEvent: emitEvent);
  }

  void specializationsValueReset(
    List<String> value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      specializationsControl.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void pricingValueReset(
    int value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      pricingControl.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void basicInfoValueReset(
    BasicInfo? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      basicInfoControl?.reset(
          value: BasicInfoForm.formElements(value).rawValue,
          updateParent: updateParent,
          emitEvent: emitEvent);
  void experienceInfoValueReset(
    ExperienceInfo? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      experienceInfoControl?.reset(
          value: ExperienceInfoForm.formElements(value).rawValue,
          updateParent: updateParent,
          emitEvent: emitEvent);
  void availabilityValueReset(
    List<WorkDayInfo> value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      availabilityControl.reset(
          value: value
              .map((e) => WorkDayInfoForm.formElements(e).rawValue)
              .toList(),
          updateParent: updateParent,
          emitEvent: emitEvent);
  FormControl<List<String>> get specializationsControl =>
      form.control(specializationsControlPath()) as FormControl<List<String>>;
  FormControl<int> get pricingControl =>
      form.control(pricingControlPath()) as FormControl<int>;
  FormGroup? get basicInfoControl => containsBasicInfo
      ? form.control(basicInfoControlPath()) as FormGroup?
      : null;
  FormGroup? get experienceInfoControl => containsExperienceInfo
      ? form.control(experienceInfoControlPath()) as FormGroup?
      : null;
  FormArray<Map<String, Object?>> get availabilityControl =>
      form.control(availabilityControlPath())
          as FormArray<Map<String, Object?>>;
  BasicInfoForm get basicInfoForm =>
      BasicInfoForm(form, pathBuilder('basicInfo'));
  ExperienceInfoForm get experienceInfoForm =>
      ExperienceInfoForm(form, pathBuilder('experienceInfo'));
  List<WorkDayInfoForm> get availabilityWorkDayInfoForm =>
      (availabilityControl.value ?? [])
          .asMap()
          .map((k, v) => MapEntry(
              k, WorkDayInfoForm(form, pathBuilder("availability.$k"))))
          .values
          .toList();
  void specializationsSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      specializationsControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      specializationsControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void pricingSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      pricingControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      pricingControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void basicInfoSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      basicInfoControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      basicInfoControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void experienceInfoSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      experienceInfoControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      experienceInfoControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void availabilitySetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      availabilityControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      availabilityControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  ExtendedControl<List<Map<String, Object?>?>, List<WorkDayInfoForm>>
      get availabilityExtendedControl =>
          ExtendedControl<List<Map<String, Object?>?>, List<WorkDayInfoForm>>(
              form.control(availabilityControlPath())
                  as FormArray<Map<String, Object?>>,
              () => availabilityWorkDayInfoForm);
  void addAvailabilityItem(WorkDayInfo value) {
    availabilityControl.add(WorkDayInfoForm.formElements(value));
  }

  void removeAvailabilityItemAtIndex(int i) {
    if ((availabilityControl.value ?? []).length > i) {
      availabilityControl.removeAt(i);
    }
  }

  void addAvailabilityItemList(List<WorkDayInfo> value) {
    value.map((e) => addAvailabilityItem(e));
  }

  @override
  Onboarding get model {
    final currentForm = path == null ? form : form.control(path!);

    if (!currentForm.valid) {
      debugPrint(
          '[${path ?? 'OnboardingForm'}]\n┗━ Avoid calling `model` on invalid form. Possible exceptions for non-nullable fields which should be guarded by `required` validator.');
    }
    return Onboarding(
        basicInfo: _basicInfoValue,
        specializations: _specializationsValue,
        experienceInfo: _experienceInfoValue,
        pricing: _pricingValue,
        availability: _availabilityValue);
  }

  void submit({
    required void Function(Onboarding model) onValid,
    void Function()? onNotValid,
  }) {
    form.markAllAsTouched();
    if (form.valid) {
      onValid(model);
    } else {
      onNotValid?.call();
    }
  }

  @override
  void updateValue(
    Onboarding value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.updateValue(OnboardingForm.formElements(value).rawValue,
          updateParent: updateParent, emitEvent: emitEvent);
  @override
  void reset({
    Onboarding? value,
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.reset(
          value: value != null ? formElements(value).rawValue : null,
          updateParent: updateParent,
          emitEvent: emitEvent);
  String pathBuilder(String? pathItem) =>
      [path, pathItem].whereType<String>().join(".");
  static FormGroup formElements(Onboarding? onboarding) => FormGroup({
        specializationsControlName: FormControl<List<String>>(
            value: onboarding?.specializations,
            validators: [RequiredValidator()],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        pricingControlName: FormControl<int>(
            value: onboarding?.pricing,
            validators: [MinValidator(1)],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        availabilityControlName: FormArray(
            (onboarding?.availability ?? [])
                .map((e) => WorkDayInfoForm.formElements(e))
                .toList(),
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false),
        basicInfoControlName: BasicInfoForm.formElements(onboarding?.basicInfo),
        experienceInfoControlName:
            ExperienceInfoForm.formElements(onboarding?.experienceInfo)
      },
          validators: [],
          asyncValidators: [],
          asyncValidatorsDebounceTime: 250,
          disabled: false);
}

class BasicInfoForm implements FormModel<BasicInfo> {
  BasicInfoForm(
    this.form,
    this.path,
  );

  static const String firstNameControlName = "firstName";

  static const String lastNameControlName = "lastName";

  static const String emailControlName = "email";

  static const String dateOfBirthControlName = "dateOfBirth";

  final FormGroup form;

  final String? path;

  String firstNameControlPath() => pathBuilder(firstNameControlName);
  String lastNameControlPath() => pathBuilder(lastNameControlName);
  String emailControlPath() => pathBuilder(emailControlName);
  String dateOfBirthControlPath() => pathBuilder(dateOfBirthControlName);
  String get _firstNameValue => firstNameControl.value ?? "";
  String get _lastNameValue => lastNameControl.value ?? "";
  String get _emailValue => emailControl.value ?? "";
  DateTime? get _dateOfBirthValue => dateOfBirthControl?.value;
  bool get containsFirstName {
    try {
      form.control(firstNameControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsLastName {
    try {
      form.control(lastNameControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsEmail {
    try {
      form.control(emailControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsDateOfBirth {
    try {
      form.control(dateOfBirthControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  Object? get firstNameErrors => firstNameControl.errors;
  Object? get lastNameErrors => lastNameControl.errors;
  Object? get emailErrors => emailControl.errors;
  Object? get dateOfBirthErrors => dateOfBirthControl?.errors;
  void get firstNameFocus => form.focus(firstNameControlPath());
  void get lastNameFocus => form.focus(lastNameControlPath());
  void get emailFocus => form.focus(emailControlPath());
  void get dateOfBirthFocus => form.focus(dateOfBirthControlPath());
  void dateOfBirthRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsDateOfBirth) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          dateOfBirthControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            dateOfBirthControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void firstNameValueUpdate(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    firstNameControl.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void lastNameValueUpdate(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    lastNameControl.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void emailValueUpdate(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    emailControl.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void dateOfBirthValueUpdate(
    DateTime? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    dateOfBirthControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void firstNameValuePatch(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    firstNameControl.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void lastNameValuePatch(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    lastNameControl.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void emailValuePatch(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    emailControl.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void dateOfBirthValuePatch(
    DateTime? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    dateOfBirthControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void firstNameValueReset(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      firstNameControl.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void lastNameValueReset(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      lastNameControl.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void emailValueReset(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      emailControl.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void dateOfBirthValueReset(
    DateTime? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      dateOfBirthControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  FormControl<String> get firstNameControl =>
      form.control(firstNameControlPath()) as FormControl<String>;
  FormControl<String> get lastNameControl =>
      form.control(lastNameControlPath()) as FormControl<String>;
  FormControl<String> get emailControl =>
      form.control(emailControlPath()) as FormControl<String>;
  FormControl<DateTime>? get dateOfBirthControl => containsDateOfBirth
      ? form.control(dateOfBirthControlPath()) as FormControl<DateTime>?
      : null;
  void firstNameSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      firstNameControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      firstNameControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void lastNameSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      lastNameControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      lastNameControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void emailSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      emailControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      emailControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void dateOfBirthSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      dateOfBirthControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      dateOfBirthControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  @override
  BasicInfo get model {
    final currentForm = path == null ? form : form.control(path!);

    if (!currentForm.valid) {
      debugPrint(
          '[${path ?? 'BasicInfoForm'}]\n┗━ Avoid calling `model` on invalid form. Possible exceptions for non-nullable fields which should be guarded by `required` validator.');
    }
    return BasicInfo(
        firstName: _firstNameValue,
        lastName: _lastNameValue,
        email: _emailValue,
        dateOfBirth: _dateOfBirthValue);
  }

  void submit({
    required void Function(BasicInfo model) onValid,
    void Function()? onNotValid,
  }) {
    form.markAllAsTouched();
    if (form.valid) {
      onValid(model);
    } else {
      onNotValid?.call();
    }
  }

  @override
  void updateValue(
    BasicInfo? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.updateValue(BasicInfoForm.formElements(value).rawValue,
          updateParent: updateParent, emitEvent: emitEvent);
  @override
  void reset({
    BasicInfo? value,
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.reset(
          value: value != null ? formElements(value).rawValue : null,
          updateParent: updateParent,
          emitEvent: emitEvent);
  String pathBuilder(String? pathItem) =>
      [path, pathItem].whereType<String>().join(".");
  static FormGroup formElements(BasicInfo? basicInfo) => FormGroup({
        firstNameControlName: FormControl<String>(
            value: basicInfo?.firstName,
            validators: [RequiredValidator()],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        lastNameControlName: FormControl<String>(
            value: basicInfo?.lastName,
            validators: [RequiredValidator()],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        emailControlName: FormControl<String>(
            value: basicInfo?.email,
            validators: [RequiredValidator(), EmailValidator()],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        dateOfBirthControlName: FormControl<DateTime>(
            value: basicInfo?.dateOfBirth,
            validators: [RequiredValidator()],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false)
      },
          validators: [],
          asyncValidators: [],
          asyncValidatorsDebounceTime: 250,
          disabled: false);
}

class ExperienceInfoForm implements FormModel<ExperienceInfo> {
  ExperienceInfoForm(
    this.form,
    this.path,
  );

  static const String experienceControlName = "experience";

  static const String noExperienceControlName = "noExperience";

  static const String aboutControlName = "about";

  static const String educationControlName = "education";

  final FormGroup form;

  final String? path;

  String experienceControlPath() => pathBuilder(experienceControlName);
  String noExperienceControlPath() => pathBuilder(noExperienceControlName);
  String aboutControlPath() => pathBuilder(aboutControlName);
  String educationControlPath() => pathBuilder(educationControlName);
  DateTime? get _experienceValue => experienceControl?.value;
  bool? get _noExperienceValue => noExperienceControl?.value;
  String? get _aboutValue => aboutControl?.value;
  String? get _educationValue => educationControl?.value;
  bool get containsExperience {
    try {
      form.control(experienceControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsNoExperience {
    try {
      form.control(noExperienceControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsAbout {
    try {
      form.control(aboutControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsEducation {
    try {
      form.control(educationControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  Object? get experienceErrors => experienceControl?.errors;
  Object? get noExperienceErrors => noExperienceControl?.errors;
  Object? get aboutErrors => aboutControl?.errors;
  Object? get educationErrors => educationControl?.errors;
  void get experienceFocus => form.focus(experienceControlPath());
  void get noExperienceFocus => form.focus(noExperienceControlPath());
  void get aboutFocus => form.focus(aboutControlPath());
  void get educationFocus => form.focus(educationControlPath());
  void experienceRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsExperience) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          experienceControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            experienceControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void noExperienceRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsNoExperience) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          noExperienceControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            noExperienceControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void aboutRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsAbout) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          aboutControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            aboutControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void educationRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsEducation) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          educationControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            educationControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void experienceValueUpdate(
    DateTime? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    experienceControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void noExperienceValueUpdate(
    bool? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    noExperienceControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void aboutValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    aboutControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void educationValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    educationControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void experienceValuePatch(
    DateTime? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    experienceControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void noExperienceValuePatch(
    bool? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    noExperienceControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void aboutValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    aboutControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void educationValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    educationControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void experienceValueReset(
    DateTime? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      experienceControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void noExperienceValueReset(
    bool? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      noExperienceControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void aboutValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      aboutControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void educationValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      educationControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  FormControl<DateTime>? get experienceControl => containsExperience
      ? form.control(experienceControlPath()) as FormControl<DateTime>?
      : null;
  FormControl<bool>? get noExperienceControl => containsNoExperience
      ? form.control(noExperienceControlPath()) as FormControl<bool>?
      : null;
  FormControl<String>? get aboutControl => containsAbout
      ? form.control(aboutControlPath()) as FormControl<String>?
      : null;
  FormControl<String>? get educationControl => containsEducation
      ? form.control(educationControlPath()) as FormControl<String>?
      : null;
  void experienceSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      experienceControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      experienceControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void noExperienceSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      noExperienceControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      noExperienceControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void aboutSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      aboutControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      aboutControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void educationSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      educationControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      educationControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  @override
  ExperienceInfo get model {
    final currentForm = path == null ? form : form.control(path!);

    if (!currentForm.valid) {
      debugPrint(
          '[${path ?? 'ExperienceInfoForm'}]\n┗━ Avoid calling `model` on invalid form. Possible exceptions for non-nullable fields which should be guarded by `required` validator.');
    }
    return ExperienceInfo(
        experience: _experienceValue,
        noExperience: _noExperienceValue,
        about: _aboutValue,
        education: _educationValue);
  }

  void submit({
    required void Function(ExperienceInfo model) onValid,
    void Function()? onNotValid,
  }) {
    form.markAllAsTouched();
    if (form.valid) {
      onValid(model);
    } else {
      onNotValid?.call();
    }
  }

  @override
  void updateValue(
    ExperienceInfo? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.updateValue(ExperienceInfoForm.formElements(value).rawValue,
          updateParent: updateParent, emitEvent: emitEvent);
  @override
  void reset({
    ExperienceInfo? value,
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.reset(
          value: value != null ? formElements(value).rawValue : null,
          updateParent: updateParent,
          emitEvent: emitEvent);
  String pathBuilder(String? pathItem) =>
      [path, pathItem].whereType<String>().join(".");
  static FormGroup formElements(ExperienceInfo? experienceInfo) => FormGroup({
        experienceControlName: FormControl<DateTime>(
            value: experienceInfo?.experience,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        noExperienceControlName: FormControl<bool>(
            value: experienceInfo?.noExperience,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        aboutControlName: FormControl<String>(
            value: experienceInfo?.about,
            validators: [RequiredValidator()],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        educationControlName: FormControl<String>(
            value: experienceInfo?.education,
            validators: [RequiredValidator()],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false)
      },
          validators: [
            ExperienceInfoValidator()
          ],
          asyncValidators: [],
          asyncValidatorsDebounceTime: 250,
          disabled: false);
}

class WorkDayInfoForm implements FormModel<WorkDayInfo> {
  WorkDayInfoForm(
    this.form,
    this.path,
  );

  static const String weekdayControlName = "weekday";

  static const String shortWeekdayControlName = "shortWeekday";

  static const String startTimeControlName = "startTime";

  static const String endTimeControlName = "endTime";

  final FormGroup form;

  final String? path;

  String weekdayControlPath() => pathBuilder(weekdayControlName);
  String shortWeekdayControlPath() => pathBuilder(shortWeekdayControlName);
  String startTimeControlPath() => pathBuilder(startTimeControlName);
  String endTimeControlPath() => pathBuilder(endTimeControlName);
  String get _weekdayValue => weekdayControl.value ?? "";
  String get _shortWeekdayValue => shortWeekdayControl.value ?? "";
  TimeOfDay? get _startTimeValue => startTimeControl?.value;
  TimeOfDay? get _endTimeValue => endTimeControl?.value;
  bool get containsWeekday {
    try {
      form.control(weekdayControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsShortWeekday {
    try {
      form.control(shortWeekdayControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsStartTime {
    try {
      form.control(startTimeControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsEndTime {
    try {
      form.control(endTimeControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  Object? get weekdayErrors => weekdayControl.errors;
  Object? get shortWeekdayErrors => shortWeekdayControl.errors;
  Object? get startTimeErrors => startTimeControl?.errors;
  Object? get endTimeErrors => endTimeControl?.errors;
  void get weekdayFocus => form.focus(weekdayControlPath());
  void get shortWeekdayFocus => form.focus(shortWeekdayControlPath());
  void get startTimeFocus => form.focus(startTimeControlPath());
  void get endTimeFocus => form.focus(endTimeControlPath());
  void startTimeRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsStartTime) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          startTimeControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            startTimeControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void endTimeRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsEndTime) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          endTimeControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            endTimeControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void weekdayValueUpdate(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    weekdayControl.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void shortWeekdayValueUpdate(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    shortWeekdayControl.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void startTimeValueUpdate(
    TimeOfDay? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    startTimeControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void endTimeValueUpdate(
    TimeOfDay? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    endTimeControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void weekdayValuePatch(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    weekdayControl.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void shortWeekdayValuePatch(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    shortWeekdayControl.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void startTimeValuePatch(
    TimeOfDay? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    startTimeControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void endTimeValuePatch(
    TimeOfDay? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    endTimeControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void weekdayValueReset(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      weekdayControl.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void shortWeekdayValueReset(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      shortWeekdayControl.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void startTimeValueReset(
    TimeOfDay? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      startTimeControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void endTimeValueReset(
    TimeOfDay? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      endTimeControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  FormControl<String> get weekdayControl =>
      form.control(weekdayControlPath()) as FormControl<String>;
  FormControl<String> get shortWeekdayControl =>
      form.control(shortWeekdayControlPath()) as FormControl<String>;
  FormControl<TimeOfDay>? get startTimeControl => containsStartTime
      ? form.control(startTimeControlPath()) as FormControl<TimeOfDay>?
      : null;
  FormControl<TimeOfDay>? get endTimeControl => containsEndTime
      ? form.control(endTimeControlPath()) as FormControl<TimeOfDay>?
      : null;
  void weekdaySetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      weekdayControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      weekdayControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void shortWeekdaySetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      shortWeekdayControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      shortWeekdayControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void startTimeSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      startTimeControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      startTimeControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void endTimeSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      endTimeControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      endTimeControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  @override
  WorkDayInfo get model {
    final currentForm = path == null ? form : form.control(path!);

    if (!currentForm.valid) {
      debugPrint(
          '[${path ?? 'WorkDayInfoForm'}]\n┗━ Avoid calling `model` on invalid form. Possible exceptions for non-nullable fields which should be guarded by `required` validator.');
    }
    return WorkDayInfo(
        weekday: _weekdayValue,
        shortWeekday: _shortWeekdayValue,
        startTime: _startTimeValue,
        endTime: _endTimeValue);
  }

  void submit({
    required void Function(WorkDayInfo model) onValid,
    void Function()? onNotValid,
  }) {
    form.markAllAsTouched();
    if (form.valid) {
      onValid(model);
    } else {
      onNotValid?.call();
    }
  }

  @override
  void updateValue(
    WorkDayInfo value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.updateValue(WorkDayInfoForm.formElements(value).rawValue,
          updateParent: updateParent, emitEvent: emitEvent);
  @override
  void reset({
    WorkDayInfo? value,
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.reset(
          value: value != null ? formElements(value).rawValue : null,
          updateParent: updateParent,
          emitEvent: emitEvent);
  String pathBuilder(String? pathItem) =>
      [path, pathItem].whereType<String>().join(".");
  static FormGroup formElements(WorkDayInfo? workDayInfo) => FormGroup({
        weekdayControlName: FormControl<String>(
            value: workDayInfo?.weekday,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        shortWeekdayControlName: FormControl<String>(
            value: workDayInfo?.shortWeekday,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        startTimeControlName: FormControl<TimeOfDay>(
            value: workDayInfo?.startTime,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        endTimeControlName: FormControl<TimeOfDay>(
            value: workDayInfo?.endTime,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false)
      },
          validators: [],
          asyncValidators: [],
          asyncValidatorsDebounceTime: 250,
          disabled: false);
}

class ReactiveOnboardingFormArrayBuilder<T> extends StatelessWidget {
  const ReactiveOnboardingFormArrayBuilder({
    Key? key,
    this.control,
    this.formControl,
    this.builder,
    required this.itemBuilder,
  })  : assert(control != null || formControl != null,
            "You have to specify `control` or `formControl`!"),
        super(key: key);

  final FormArray<T>? formControl;

  final FormArray<T>? Function(OnboardingForm formModel)? control;

  final Widget Function(BuildContext context, List<Widget> itemList,
      OnboardingForm formModel)? builder;

  final Widget Function(
          BuildContext context, int i, T? item, OnboardingForm formModel)
      itemBuilder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveOnboardingForm.of(context);

    if (formModel == null) {
      throw FormControlParentNotFoundException(this);
    }

    return ReactiveFormArray<T>(
      formArray: formControl ?? control?.call(formModel),
      builder: (context, formArray, child) {
        final itemList = (formArray.value ?? [])
            .asMap()
            .map((i, item) {
              return MapEntry(
                i,
                itemBuilder(
                  context,
                  i,
                  item,
                  formModel,
                ),
              );
            })
            .values
            .toList();

        return builder?.call(
              context,
              itemList,
              formModel,
            ) ??
            Column(children: itemList);
      },
    );
  }
}

class ReactiveOnboardingFormFormGroupArrayBuilder<V> extends StatelessWidget {
  const ReactiveOnboardingFormFormGroupArrayBuilder({
    Key? key,
    this.extended,
    this.getExtended,
    this.builder,
    required this.itemBuilder,
  })  : assert(extended != null || getExtended != null,
            "You have to specify `control` or `formControl`!"),
        super(key: key);

  final ExtendedControl<List<Map<String, Object?>?>, List<V>>? extended;

  final ExtendedControl<List<Map<String, Object?>?>, List<V>> Function(
      OnboardingForm formModel)? getExtended;

  final Widget Function(BuildContext context, List<Widget> itemList,
      OnboardingForm formModel)? builder;

  final Widget Function(
          BuildContext context, int i, V? item, OnboardingForm formModel)
      itemBuilder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveOnboardingForm.of(context);

    if (formModel == null) {
      throw FormControlParentNotFoundException(this);
    }

    final value = (extended ?? getExtended?.call(formModel))!;

    return StreamBuilder<List<Map<String, Object?>?>?>(
      stream: value.control.valueChanges,
      builder: (context, snapshot) {
        final itemList = (value.value() ?? <V>[])
            .asMap()
            .map((i, item) => MapEntry(
                  i,
                  itemBuilder(
                    context,
                    i,
                    item,
                    formModel,
                  ),
                ))
            .values
            .toList();

        return builder?.call(
              context,
              itemList,
              formModel,
            ) ??
            Column(children: itemList);
      },
    );
  }
}

class ReactiveWorkDayInfoFormConsumer extends StatelessWidget {
  const ReactiveWorkDayInfoFormConsumer({
    Key? key,
    required this.builder,
    this.child,
  }) : super(key: key);

  final Widget? child;

  final Widget Function(
      BuildContext context, WorkDayInfoForm formModel, Widget? child) builder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveWorkDayInfoForm.of(context);

    if (formModel is! WorkDayInfoForm) {
      throw FormControlParentNotFoundException(this);
    }
    return builder(context, formModel, child);
  }
}

class WorkDayInfoFormInheritedStreamer extends InheritedStreamer<dynamic> {
  const WorkDayInfoFormInheritedStreamer({
    Key? key,
    required this.form,
    required Stream<dynamic> stream,
    required Widget child,
  }) : super(
          stream,
          child,
          key: key,
        );

  final WorkDayInfoForm form;
}

class ReactiveWorkDayInfoForm extends StatelessWidget {
  const ReactiveWorkDayInfoForm({
    Key? key,
    required this.form,
    required this.child,
    this.onWillPop,
  }) : super(key: key);

  final Widget child;

  final WorkDayInfoForm form;

  final WillPopCallback? onWillPop;

  static WorkDayInfoForm? of(
    BuildContext context, {
    bool listen = true,
  }) {
    if (listen) {
      return context
          .dependOnInheritedWidgetOfExactType<
              WorkDayInfoFormInheritedStreamer>()
          ?.form;
    }

    final element = context.getElementForInheritedWidgetOfExactType<
        WorkDayInfoFormInheritedStreamer>();
    return element == null
        ? null
        : (element.widget as WorkDayInfoFormInheritedStreamer).form;
  }

  @override
  Widget build(BuildContext context) {
    return WorkDayInfoFormInheritedStreamer(
      form: form,
      stream: form.form.statusChanged,
      child: WillPopScope(
        onWillPop: onWillPop,
        child: child,
      ),
    );
  }
}

class WorkDayInfoFormBuilder extends StatefulWidget {
  const WorkDayInfoFormBuilder({
    Key? key,
    this.model,
    this.child,
    this.onWillPop,
    required this.builder,
    this.initState,
  }) : super(key: key);

  final WorkDayInfo? model;

  final Widget? child;

  final WillPopCallback? onWillPop;

  final Widget Function(
      BuildContext context, WorkDayInfoForm formModel, Widget? child) builder;

  final void Function(BuildContext context, WorkDayInfoForm formModel)?
      initState;

  @override
  _WorkDayInfoFormBuilderState createState() => _WorkDayInfoFormBuilderState();
}

class _WorkDayInfoFormBuilderState extends State<WorkDayInfoFormBuilder> {
  late WorkDayInfoForm _formModel;

  @override
  void initState() {
    _formModel =
        WorkDayInfoForm(WorkDayInfoForm.formElements(widget.model), null);

    if (_formModel.form.disabled) {
      _formModel.form.markAsDisabled();
    }

    widget.initState?.call(context, _formModel);

    super.initState();
  }

  @override
  void didUpdateWidget(covariant WorkDayInfoFormBuilder oldWidget) {
    if (widget.model != oldWidget.model) {
      _formModel =
          WorkDayInfoForm(WorkDayInfoForm.formElements(widget.model), null);

      if (_formModel.form.disabled) {
        _formModel.form.markAsDisabled();
      }

      widget.initState?.call(context, _formModel);
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _formModel.form.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveWorkDayInfoForm(
      key: ObjectKey(_formModel),
      form: _formModel,
      onWillPop: widget.onWillPop,
      child: ReactiveFormBuilder(
        form: () => _formModel.form,
        onWillPop: widget.onWillPop,
        builder: (context, formGroup, child) =>
            widget.builder(context, _formModel, widget.child),
        child: widget.child,
      ),
    );
  }
}

class ReactiveWorkDayInfoFormArrayBuilder<T> extends StatelessWidget {
  const ReactiveWorkDayInfoFormArrayBuilder({
    Key? key,
    this.control,
    this.formControl,
    this.builder,
    required this.itemBuilder,
  })  : assert(control != null || formControl != null,
            "You have to specify `control` or `formControl`!"),
        super(key: key);

  final FormArray<T>? formControl;

  final FormArray<T>? Function(WorkDayInfoForm formModel)? control;

  final Widget Function(BuildContext context, List<Widget> itemList,
      WorkDayInfoForm formModel)? builder;

  final Widget Function(
          BuildContext context, int i, T? item, WorkDayInfoForm formModel)
      itemBuilder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveWorkDayInfoForm.of(context);

    if (formModel == null) {
      throw FormControlParentNotFoundException(this);
    }

    return ReactiveFormArray<T>(
      formArray: formControl ?? control?.call(formModel),
      builder: (context, formArray, child) {
        final itemList = (formArray.value ?? [])
            .asMap()
            .map((i, item) {
              return MapEntry(
                i,
                itemBuilder(
                  context,
                  i,
                  item,
                  formModel,
                ),
              );
            })
            .values
            .toList();

        return builder?.call(
              context,
              itemList,
              formModel,
            ) ??
            Column(children: itemList);
      },
    );
  }
}

class ReactiveWorkDayInfoFormFormGroupArrayBuilder<V> extends StatelessWidget {
  const ReactiveWorkDayInfoFormFormGroupArrayBuilder({
    Key? key,
    this.extended,
    this.getExtended,
    this.builder,
    required this.itemBuilder,
  })  : assert(extended != null || getExtended != null,
            "You have to specify `control` or `formControl`!"),
        super(key: key);

  final ExtendedControl<List<Map<String, Object?>?>, List<V>>? extended;

  final ExtendedControl<List<Map<String, Object?>?>, List<V>> Function(
      WorkDayInfoForm formModel)? getExtended;

  final Widget Function(BuildContext context, List<Widget> itemList,
      WorkDayInfoForm formModel)? builder;

  final Widget Function(
          BuildContext context, int i, V? item, WorkDayInfoForm formModel)
      itemBuilder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveWorkDayInfoForm.of(context);

    if (formModel == null) {
      throw FormControlParentNotFoundException(this);
    }

    final value = (extended ?? getExtended?.call(formModel))!;

    return StreamBuilder<List<Map<String, Object?>?>?>(
      stream: value.control.valueChanges,
      builder: (context, snapshot) {
        final itemList = (value.value() ?? <V>[])
            .asMap()
            .map((i, item) => MapEntry(
                  i,
                  itemBuilder(
                    context,
                    i,
                    item,
                    formModel,
                  ),
                ))
            .values
            .toList();

        return builder?.call(
              context,
              itemList,
              formModel,
            ) ??
            Column(children: itemList);
      },
    );
  }
}
