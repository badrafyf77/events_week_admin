import 'package:events_week_admin/core/models/event_model.dart';
import 'package:events_week_admin/core/utils/customs/drop_down_field.dart';
import 'package:events_week_admin/core/utils/styles.dart';
import 'package:flutter/material.dart';

class ChooseInitialEvent extends StatefulWidget {
  const ChooseInitialEvent({
    super.key,
    required this.eventsList,
  });

  final List<Event> eventsList;

  @override
  State<ChooseInitialEvent> createState() => _ChooseInitialEventState();
}

class _ChooseInitialEventState extends State<ChooseInitialEvent> {
  List<String> items = [];
  @override
  void initState() {
    super.initState();
    getEventsTitle();
  }

  getEventsTitle() {
    for (var element in widget.eventsList) {
      items.add(element.title);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Choisir l\'événement initial',
          style: Styles.normal15,
        ),
        const SizedBox(
          width: 10,
        ),
        SizedBox(
          height: 40,
          width: 300,
          child: (items.isNotEmpty)
              ? MyDropDownField(
                  onChanged: (value) {},
                  items: items,
                )
              : const SizedBox(),
        )
      ],
    );
  }
}
