import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:mint_core/mint_utils.dart';

import '../../../widgets/mint_view_bar.dart';
import '../../../widgets/scrollable_area.dart';
import 'widgets/specialist_data_widget.dart';

@RoutePage()
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late String _selectedItem = _items.first;

  List<String> get _items => [
        'Overview',
        'Recent tasks',
        'Upcoming appointments',
      ];

  @override
  Widget build(BuildContext context) {
    return ScrollableArea(
      child: Center(
        child: FractionallySizedBox(
          heightFactor: 0.95,
          widthFactor: 0.8,
          child: SelectionArea(
            child: Column(
              children: <Widget>[
                Flexible(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(20),
                      child: SpecialistDataWidget(),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                MintViewBar(
                  selectedView: _selectedItem,
                  viewItems: _items
                      .map((e) => MintViewBarItem(value: e, title: e))
                      .toList(),
                  onViewChange: (view) => setState(() => _selectedItem = view),
                ),
                const SizedBox(height: 30),
                Row(
                  children: List.generate(
                    3,
                    (index) => Expanded(
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )..insertBetween(const SizedBox(width: 30)),
                ),
                const SizedBox(height: 30),
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
