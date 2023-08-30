import 'package:flutter/material.dart';

class MintSelectionButton<T> extends StatelessWidget {
  const MintSelectionButton({
    required this.value,
    required this.title,
    required this.isSelected,
    super.key,
    this.onSelect,
    this.isDisabled,
    this.borderRadius,
    this.itemAlignment,
    this.itemInnerPadding,
    this.itemTextStyle,
    this.unselectedTextStyle,
    this.disabledTextStyle,
    this.width,
  });

  final T value;
  final String title;
  final bool isSelected;
  final void Function(T)? onSelect;
  final bool? isDisabled;
  final BorderRadius? borderRadius;
  final AlignmentGeometry? itemAlignment;
  final EdgeInsetsGeometry? itemInnerPadding;
  final TextStyle? itemTextStyle;
  final TextStyle? unselectedTextStyle;
  final TextStyle? disabledTextStyle;
  final double? width;

  TextStyle? _getTextStyle() {
    final disabled = isDisabled;
    if (disabled != null && disabled && disabledTextStyle != null) {
      return disabledTextStyle;
    } else if (!isSelected && unselectedTextStyle != null) {
      return unselectedTextStyle;
    } else {
      return itemTextStyle ?? const TextStyle(fontSize: 16, height: 1.3);
    }
  }

  bool get buttonDisabled {
    final disabled = isDisabled;
    return disabled != null && disabled;
  }

  @override
  Widget build(BuildContext context) {
    final onSelectLocal = onSelect;
    return InkWell(
      onTap: buttonDisabled
          ? null
          : onSelectLocal != null
              ? () => onSelectLocal(value)
              : null,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: width,
        padding: itemInnerPadding,
        alignment: itemAlignment,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(10),
          border: isSelected
              ? Border.all(
                  color: Theme.of(context).colorScheme.primary,
                  strokeAlign: BorderSide.strokeAlignOutside,
                  width: 2,
                )
              : null,
        ),
        child: Text(title, style: _getTextStyle()),
      ),
    );
  }
}
