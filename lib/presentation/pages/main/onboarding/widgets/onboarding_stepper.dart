import 'package:flutter/material.dart';

import '../../../../../gen/colors.gen.dart';

class OnboardingStepper extends StatelessWidget {
  const OnboardingStepper({
    required this.currentStep,
    required this.totalSteps,
    this.circleSize = 28,
    this.lineHeight = 1,
    super.key,
  }) : assert(
            currentStep >= 0 && currentStep <= totalSteps,
            '[currentStep can not be lower than zero or greater than '
            '[totalSteps] count.\n[currentStep]: $currentStep, [totalSteps]: '
            '$totalSteps');

  final int currentStep;
  final int totalSteps;
  final double circleSize;
  final double lineHeight;

  Color get _enabledColor => MintColors.stepperBlue;

  Color get _disabledColor => MintColors.stepperGrey;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _buildSteps(),
    );
  }

  List<Widget> _buildSteps() {
    final steps = <Widget>[];

    for (var step = 1; step <= totalSteps; step++) {
      steps.add(_buildStepCircle(step));
      if (step < totalSteps) {
        steps.add(_buildStepLine(step));
      }
    }

    return steps;
  }

  Widget _buildStepCircle(int stepNumber) {
    final isActive = stepNumber == currentStep;
    final isCompleted = stepNumber < currentStep;
    final isEnabled = isActive || isCompleted;
    return Container(
      width: circleSize,
      height: circleSize,
      decoration: BoxDecoration(
        border: Border.all(
          color: isEnabled ? _enabledColor : _disabledColor,
        ),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          stepNumber.toString(),
          style: TextStyle(
            color: isEnabled ? _enabledColor : _disabledColor,
            fontSize: 11,
          ),
        ),
      ),
    );
  }

  Widget _buildStepLine(int stepNumber) {
    final isCompleted = stepNumber < currentStep;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: Container(
          height: lineHeight,
          color: isCompleted ? _enabledColor : _disabledColor,
        ),
      ),
    );
  }
}
