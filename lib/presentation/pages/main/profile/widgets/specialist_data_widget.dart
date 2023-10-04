import 'package:flutter/material.dart';
import 'package:mint_core/mint_core.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../../gen/colors.gen.dart';
import '../../../../../theme/mint_text_styles.dart';

class SpecialistDataWidget extends StatelessWidget {
  const SpecialistDataWidget({required this.specialistModel, super.key});

  final SpecialistModel? specialistModel;

  @override
  Widget build(BuildContext context) {
    final photoUrl = specialistModel?.photoUrl;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 200,
          height: 250,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Theme.of(context).scaffoldBackgroundColor,
            image: photoUrl != null
                ? DecorationImage(image: NetworkImage(photoUrl))
                : null,
          ),
          child: photoUrl == null
              ? Assets.svg.userPlaceholder.svg(
                  width: 200,
                  height: 250,
                  fit: BoxFit.scaleDown,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).primaryColor,
                    BlendMode.srcIn,
                  ),
                )
              : null,
        ),
        const SizedBox(width: 20),
        Expanded(
          child: SizedBox(
            height: 250,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    // TODO(wuffeel): use name
                    const Text(
                      'Specialist name',
                      style: MintTextStyles.headline1,
                    ),
                    InkWell(
                      onTap: () {
                        // TODO(wuffeel): add onEdit callback
                      },
                      child: const Icon(Icons.edit),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                // TODO(wuffeel): use status
                Text(
                  'Online',
                  style: MintTextStyles.medium16.copyWith(
                    color: MintColors.primaryBlueColor,
                  ),
                ),
                const SizedBox(height: 24),
                Divider(color: MintColors.hintColor.withOpacity(0.3)),
                const SizedBox(height: 24),
                const Expanded(child: _SpecialistInfo())
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _SpecialistInfo extends StatelessWidget {
  const _SpecialistInfo();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Date of birth:', style: MintTextStyles.medium16),
            Text('Specialities:', style: MintTextStyles.medium16),
            Text('Phone:', style: MintTextStyles.medium16),
            Text('E-mail:', style: MintTextStyles.medium16),
          ],
        ),
        SizedBox(width: 100),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('12.07.2023', style: TextStyle(fontSize: 16)),
            Text('Fears, motivation', style: TextStyle(fontSize: 16)),
            Text('+380 123 321 123', style: TextStyle(fontSize: 16)),
            Text('test@gmail.com', style: TextStyle(fontSize: 16)),
          ],
        ),
      ],
    );
  }
}
