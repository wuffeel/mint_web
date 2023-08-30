import 'package:flutter/material.dart';

import 'box_button_list.dart';

class MintSingleItemSelection<T> extends StatelessWidget {
  const MintSingleItemSelection({
    required this.items,
    required this.itemTitles,
    required this.selectedItem,
    required this.onSelect,
    super.key,
    this.itemAlignment,
    this.itemInnerPadding,
    this.itemTextStyle,
    this.unselectedTextStyle,
    this.disabledTextStyle,
    this.itemWidth,
    this.disabledItemPredicate,
    this.itemsPerRow,
    this.mainSpacing,
    this.crossSpacing,
  });

  final List<T> items;
  final List<String> itemTitles;
  final T? selectedItem;
  final ValueChanged<T>? onSelect;
  final AlignmentGeometry? itemAlignment;
  final EdgeInsetsGeometry? itemInnerPadding;
  final TextStyle? itemTextStyle;
  final TextStyle? unselectedTextStyle;
  final TextStyle? disabledTextStyle;
  final double? itemWidth;

  /// See [BoxButtonList.disabledItemPredicate]
  final bool Function(T)? disabledItemPredicate;

  /// See [BoxButtonList.itemsPerRow]
  final int? itemsPerRow;

  /// See [BoxButtonList.mainSpacing]
  final double? mainSpacing;

  /// See [BoxButtonList.crossSpacing]
  final double? crossSpacing;

  @override
  Widget build(BuildContext context) {
    return BoxButtonList(
      items: items,
      itemTitles: itemTitles,
      onSelect: onSelect,
      selectedItemPredicate: (item) => selectedItem == item,
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
