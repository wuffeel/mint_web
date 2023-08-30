import 'package:flutter/material.dart';

import 'box_button_list.dart';

class MintMultiItemSelection<T> extends StatelessWidget {
  const MintMultiItemSelection({
    required this.items,
    required this.itemTitles,
    required this.selectedItems,
    required this.onItemSelected,
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
    this.spacing,
    this.runSpacing,
  });

  final List<T> items;
  final List<String> itemTitles;
  final List<T> selectedItems;
  final void Function(List<T>?) onItemSelected;
  final AlignmentGeometry? itemAlignment;
  final EdgeInsetsGeometry? itemInnerPadding;
  final TextStyle? itemTextStyle;
  final TextStyle? unselectedTextStyle;
  final TextStyle? disabledTextStyle;
  final double? itemWidth;
  final double? spacing;
  final double? runSpacing;

  /// See [BoxButtonList.disabledItemPredicate]
  final bool Function(T)? disabledItemPredicate;

  /// See [BoxButtonList.itemsPerRow]
  final int? itemsPerRow;

  /// See [BoxButtonList.mainSpacing]
  final double? mainSpacing;

  /// See [BoxButtonList.crossSpacing]
  final double? crossSpacing;

  List<T>? _updateList(T item, bool isSelected) {
    final updated = isSelected
        ? ([...selectedItems]..remove(item))
        : [...selectedItems, item];
    return updated.isNotEmpty ? updated : null;
  }

  @override
  Widget build(BuildContext context) {
    return BoxButtonList(
      items: items,
      itemTitles: itemTitles,
      onSelect: (item) => onItemSelected(
        _updateList(item, selectedItems.contains(item)),
      ),
      selectedItemPredicate: selectedItems.contains,
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
