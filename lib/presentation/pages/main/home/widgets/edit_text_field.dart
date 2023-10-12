import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditTextField extends StatelessWidget {
  const EditTextField({
    super.key,
    this.initialValue,
    this.inputFormatters,
    this.onChanged,
    this.style,
    this.validator,
  });

  final String? initialValue;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String)? onChanged;
  final TextStyle? style;
  final String? Function(String?)? validator;

  InputDecoration _textFieldDecoration(BuildContext context) => InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black.withOpacity(0.2)),
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: const EdgeInsets.all(12),
        constraints: const BoxConstraints(),
        filled: true,
        fillColor: Theme.of(context).scaffoldBackgroundColor,
        hoverColor: Colors.transparent,
        isCollapsed: true,
        isDense: true,
      );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      initialValue: initialValue,
      decoration: _textFieldDecoration(context),
      inputFormatters: inputFormatters,
      onChanged: onChanged,
      style: style ?? const TextStyle(fontSize: 16),
      validator: validator,
    );
  }
}
