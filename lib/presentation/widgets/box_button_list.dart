import 'package:flutter/material.dart';

import '../../utils/layout_utils.dart';
import 'mint_selection_button.dart';

class BoxButtonList<T> extends StatelessWidget {
  const BoxButtonList({
    required this.items,
    required this.itemTitles,
    required this.onSelect,
    required this.selectedItemPredicate,
    super.key,
    this.disabledItemPredicate,
    this.itemsPerRow,
    this.mainSpacing,
    this.crossSpacing,
    this.itemAlignment,
    this.itemInnerPadding,
    this.itemTextStyle,
    this.unselectedTextStyle,
    this.disabledTextStyle,
    this.itemWidth,
  });

  final List<T> items;
  final List<String> itemTitles;
  final void Function(T)? onSelect;
  final AlignmentGeometry? itemAlignment;
  final EdgeInsetsGeometry? itemInnerPadding;
  final TextStyle? itemTextStyle;
  final TextStyle? unselectedTextStyle;
  final TextStyle? disabledTextStyle;

  /// If [itemsPerRow] is not null, the value is ignored.
  final double? itemWidth;

  /// Returns whether item is selected or not.
  final bool Function(T) selectedItemPredicate;

  /// Returns whether item is disabled or not.
  final bool Function(T)? disabledItemPredicate;

  /// The number of items to display per row.
  final int? itemsPerRow;

  /// The spacing between items horizontally.
  final double? mainSpacing;

  /// The spacing between items vertically.
  final double? crossSpacing;

  double _getItemSpacing(double maxWidth, int itemsPerRow) {
    return LayoutUtils.calculateSpacing(
      maxWidth,
      itemsPerRow,
      mainSpacing: mainSpacing,
    );
  }

  double _getItemWidth(double maxWidth, int itemsPerRow) {
    return LayoutUtils.getItemWidth(
      maxWidth,
      itemsPerRow,
      mainSpacing: mainSpacing,
    );
  }

  @override
  Widget build(BuildContext context) {
    final perRow = itemsPerRow;

    if (perRow != null) {
      return LayoutBuilder(
        builder: (context, constraints) {
          return _WrapButtonList(
            items: items,
            itemTitles: itemTitles,
            onSelect: onSelect,
            selectedItemPredicate: selectedItemPredicate,
            disabledItemPredicate: disabledItemPredicate,
            itemsPerRow: itemsPerRow,
            mainSpacing: _getItemSpacing(constraints.maxWidth, perRow),
            crossSpacing: crossSpacing,
            itemAlignment: itemAlignment,
            itemInnerPadding: itemInnerPadding,
            itemTextStyle: itemTextStyle,
            unselectedTextStyle: unselectedTextStyle,
            disabledTextStyle: disabledTextStyle,
            itemWidth: _getItemWidth(constraints.maxWidth, perRow),
          );
        },
      );
    } else {
      return _WrapButtonList(
        items: items,
        itemTitles: itemTitles,
        onSelect: onSelect,
        selectedItemPredicate: selectedItemPredicate,
        disabledItemPredicate: disabledItemPredicate,
        itemsPerRow: itemsPerRow,
        mainSpacing: mainSpacing,
        crossSpacing: crossSpacing,
        itemAlignment: itemAlignment,
        itemInnerPadding: itemInnerPadding,
        itemTextStyle: itemTextStyle,
        unselectedTextStyle: unselectedTextStyle,
        disabledTextStyle: disabledTextStyle,
        itemWidth: itemWidth,
      );
    }
  }
}

class _WrapButtonList<T> extends StatelessWidget {
  const _WrapButtonList({
    required this.items,
    required this.itemTitles,
    required this.onSelect,
    required this.selectedItemPredicate,
    required this.disabledItemPredicate,
    required this.itemsPerRow,
    required this.mainSpacing,
    required this.crossSpacing,
    required this.itemAlignment,
    required this.itemInnerPadding,
    required this.itemTextStyle,
    required this.unselectedTextStyle,
    required this.disabledTextStyle,
    required this.itemWidth,
  });

  final List<T> items;
  final List<String> itemTitles;
  final void Function(T)? onSelect;
  final bool Function(T) selectedItemPredicate;
  final bool Function(T)? disabledItemPredicate;
  final int? itemsPerRow;
  final double? mainSpacing;
  final double? crossSpacing;
  final AlignmentGeometry? itemAlignment;
  final EdgeInsetsGeometry? itemInnerPadding;
  final TextStyle? itemTextStyle;
  final TextStyle? unselectedTextStyle;
  final TextStyle? disabledTextStyle;
  final double? itemWidth;

  bool _isCellDisabled(T value) {
    final isDisabled = disabledItemPredicate;
    return isDisabled != null && isDisabled(value);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: mainSpacing ?? 0,
      runSpacing: crossSpacing ?? 0,
      children: List.generate(
        items.length,
        (index) {
          final item = items[index];
          return MintSelectionButton(
            value: item,
            title: itemTitles[index],
            isSelected: selectedItemPredicate(item),
            onSelect: onSelect,
            isDisabled: _isCellDisabled(item),
            width: itemWidth,
            itemTextStyle: itemTextStyle,
            itemAlignment: itemAlignment,
            itemInnerPadding: itemInnerPadding,
            unselectedTextStyle: unselectedTextStyle,
            disabledTextStyle: disabledTextStyle,
          );
        },
      ),
    );
  }
}
