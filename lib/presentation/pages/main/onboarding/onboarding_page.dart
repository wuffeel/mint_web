import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entity/onboarding/onboarding.dart';
import '../../../bloc/onboarding/onboarding_bloc.dart';
import '../../../bloc/user/user_bloc.dart';
import '../../../widgets/error_try_again.dart';
import '../../auth/widgets/auth_left_panel_container.dart';
import '../../auth/widgets/auth_page_body.dart';
import 'widgets/availability_widget.dart';
import 'widgets/basic_info_widget.dart';
import 'widgets/experience_widget.dart';
import 'widgets/onboarding_stepper.dart';
import 'widgets/pricing_widget.dart';
import 'widgets/professional_skills_widget.dart';

@RoutePage()
class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingBloc(),
      child: const _OnboardingView(),
    );
  }
}

class _OnboardingView extends StatefulWidget {
  const _OnboardingView();

  @override
  State<_OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<_OnboardingView> {
  int _currentWorkDay = 0;

  final _controller = PageController();
  int _currentStep = 1;

  Duration get _pageSwitchDuration => const Duration(milliseconds: 300);

  Curve get _pageSwitchCurve => Curves.linear;

  void _previousPage() {
    setState(() {
      _controller.previousPage(
        duration: _pageSwitchDuration,
        curve: _pageSwitchCurve,
      );
    });
  }

  void _nextPage(OnboardingForm form) {
    setState(() {
      _controller.nextPage(
        duration: _pageSwitchDuration,
        curve: _pageSwitchCurve,
      );
    });
    context.read<OnboardingBloc>().add(OnboardingLogEvent(form));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthPageBody(
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserFetchLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is UserFetchFailure) {
              return ErrorTryAgain(
                onRefresh: () =>
                    context.read<UserBloc>().add(UserFetchRequested()),
              );
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const SizedBox(height: 22),
                AuthLeftPanelContainer(
                  child: SizedBox(
                    height: 40,
                    child: OnboardingStepper(
                      currentStep: _currentStep,
                      totalSteps: 5,
                    ),
                  ),
                ),
                Expanded(
                  child: BlocBuilder<OnboardingBloc, OnboardingState>(
                    builder: (context, state) {
                      return OnboardingFormBuilder(
                        model: state.model,
                        builder: (context, formModel, child) {
                          final workDayForm = formModel
                              .availabilityWorkDayInfoForm[_currentWorkDay];
                          return PageView(
                            controller: _controller,
                            onPageChanged: (page) => setState(
                              () => _currentStep = page + 1,
                            ),
                            children: <Widget>[
                              BasicInfoWidget(
                                formModel.basicInfoForm,
                                onNext: () => _nextPage(formModel),
                              ),
                              ProfessionalSkillsWidget(
                                formModel.specializationsControl,
                                onBack: _previousPage,
                                onNext: () => _nextPage(formModel),
                              ),
                              ExperienceWidget(
                                formModel.experienceInfoForm,
                                onBack: _previousPage,
                                onNext: () => _nextPage(formModel),
                              ),
                              PricingWidget(
                                formModel.pricingControl,
                                onBack: _previousPage,
                                onNext: () => _nextPage(formModel),
                              ),
                              AvailabilityWidget(
                                formModel.availabilityControl,
                                onBack: _previousPage,
                                onNext: formModel.availabilityControl.valid
                                    ? () => _nextPage(formModel)
                                    : null,
                                currentIndex: _currentWorkDay,
                                currentWorkDayForm: workDayForm,
                                onWorkDayIndexChange: (index) => setState(
                                  () => _currentWorkDay = index,
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
