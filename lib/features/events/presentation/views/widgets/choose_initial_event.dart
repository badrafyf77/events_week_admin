import 'package:events_week_admin/core/utils/customs/drop_down_field.dart';
import 'package:events_week_admin/core/utils/styles.dart';
import 'package:flutter/material.dart';

class ChooseInitialEvent extends StatelessWidget {
  const ChooseInitialEvent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> items = [
      'Site Ain Harouda',
      'Site Berrechid 1',
      'Site Berrechid 2',
      'Site Ain Sebaa',
    ];
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Choisir l\'événement initial',
          style: Styles.normal16,
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          height: 40,
          width: 300,
          child: MyDropDownField(
            onChanged: (value) {},
            items: items,
          ),
        )
      ],
    );
  }
}

