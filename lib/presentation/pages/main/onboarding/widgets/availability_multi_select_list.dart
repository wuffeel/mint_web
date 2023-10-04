import 'package:flutter/material.dart';
import 'package:mint_core/mint_utils.dart';
import '../../../../../l10n/l10n.dart';
import 'weekday_container.dart';

class AvailabilityMultiSelectList extends StatefulWidget {
  const AvailabilityMultiSelectList({
    required this.shortWeekdays,
    required this.onApply,
    super.key,
  });

  final List<String> shortWeekdays;
  final void Function(List<String> selectedWeekdays) onApply;

  @override
  State<AvailabilityMultiSelectList> createState() =>
      _AvailabilityMultiSelectListState();
}

class _AvailabilityMultiSelectListState
    extends State<AvailabilityMultiSelectList> {
  final _selectedWeekdays = <String>[];

  void _updateSelected(String shortWeekday, bool isSelected) {
    isSelected
        ? _selectedWeekdays.remove(shortWeekday)
        : _selectedWeekdays.add(shortWeekday);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            widget.shortWeekdays.length,
            (index) {
              final shortWeekday = widget.shortWeekdays[index];
              final isSelected = _selectedWeekdays.contains(shortWeekday);
              return Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() => _updateSelected(shortWeekday, isSelected));
                  },
                  child: WeekdayContainer(
                    shortWeekday: shortWeekday,
                    isSelected: isSelected,
                    height: 48,
                  ),
                ),
              );
            },
          )..insertBetween(const SizedBox(width: 20)),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () => widget.onApply(_selectedWeekdays),
          child: Text(context.l10n.apply),
        ),
      ],
    );
  }
}
