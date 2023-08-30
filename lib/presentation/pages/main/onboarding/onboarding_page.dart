import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entity/experience_model.dart';
import '../../../../domain/entity/user_model/user_model.dart';
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
class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  var _userInfo = const UserModel(id: '');
  List<String>? _specializations;
  var _experience = ExperienceModel();
  int _pricing = 0;
  var _workInfo = <String, Map<String, String>>{};
  var _timeOfDayInfo = <String, Map<String, TimeOfDay?>?>{};

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

  void _nextPage() {
    setState(() {
      _controller.nextPage(
        duration: _pageSwitchDuration,
        curve: _pageSwitchCurve,
      );
    });
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
                  child: PageView(
                    controller: _controller,
                    onPageChanged: (page) => setState(
                      () => _currentStep = page + 1,
                    ),
                    children: <Widget>[
                      BasicInfoWidget(
                        onNext: _nextPage,
                        onDataChange: (info) => setState(
                          () => _userInfo = info,
                        ),
                        userInfo: _userInfo,
                      ),
                      ProfessionalSkillsWidget(
                        onBack: _previousPage,
                        onNext: _nextPage,
                        selectedSpecializations: _specializations,
                        onChange: (specializations) => setState(
                          () => _specializations = specializations,
                        ),
                      ),
                      ExperienceWidget(
                        onBack: _previousPage,
                        onNext: _nextPage,
                        experienceData: _experience,
                        onChange: (experience) => setState(
                          () => _experience = experience,
                        ),
                      ),
                      PricingWidget(
                        onBack: _previousPage,
                        onNext: _nextPage,
                        selectedPricing: _pricing,
                        onChange: (pricing) => setState(
                          () => _pricing = pricing,
                        ),
                      ),
                      AvailabilityWidget(
                        onBack: _previousPage,
                        onNext: _nextPage,
                        workInfo: _workInfo,
                        timeOfDayInfo: _timeOfDayInfo,
                        onWorkInfoChange: (workInfo) => setState(
                          () => _workInfo = workInfo,
                        ),
                        onTimeInfoChange: (timeInfo) => setState(
                          () => _timeOfDayInfo = timeInfo,
                        ),
                      ),
                    ],
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
