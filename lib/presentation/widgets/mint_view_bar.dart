import 'package:flutter/material.dart';
import 'package:mint_core/mint_utils.dart';

import '../../../../../gen/colors.gen.dart';
import '../../../../../theme/mint_text_styles.dart';

class MintViewBar<T> extends StatelessWidget {
  const MintViewBar({
    required this.selectedView,
    required this.viewItems,
    required this.onViewChange,
    super.key,
    this.spacing = 100,
  });

  final T? selectedView;
  final List<MintViewBarItem<T>> viewItems;
  final void Function(T) onViewChange;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned.fill(
          bottom: 1,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 1,
              color: MintColors.appointmentsAppBarBorder,
            ),
          ),
        ),
        Row(
          children: List.generate(
            viewItems.length,
            (index) => _ViewTitle(
              view: viewItems[index].value,
              selectedView: selectedView,
              title: viewItems[index].title,
              onTap: onViewChange,
            ),
          )..insertBetween(SizedBox(width: spacing)),
        ),
      ],
    );
  }
}

class MintViewBarItem<T> {
  MintViewBarItem({
    required this.value,
    required this.title,
  });

  final T value;
  final String title;
}

class _ViewTitle<T> extends StatelessWidget {
  const _ViewTitle({
    required this.view,
    required this.selectedView,
    required this.title,
    required this.onTap,
    this.textStyle,
  });

  final T view;
  final T? selectedView;
  final String title;
  final void Function(T) onTap;
  final TextStyle? textStyle;

  bool get _isSelected => view == selectedView;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        InkWell(
          onTap: () => onTap(view),
          child: Padding(
            padding: const EdgeInsets.all(11),
            child: Text(
              title,
              style: MintTextStyles.gilroyMedium16.copyWith(
                color: _isSelected ? MintColors.primaryBlueColor : null,
              ),
            ),
          ),
        ),
        if (_isSelected)
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: MintColors.primaryBlueColor,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
