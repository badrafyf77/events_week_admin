import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:events_week_admin/core/utils/customs/button.dart';
import 'package:events_week_admin/core/utils/styles.dart';
import 'package:flutter/material.dart';

class DateAndTimePicker extends StatefulWidget {
  const DateAndTimePicker(
      {super.key, required this.height, required this.width});

  final double height;
  final double width;

  @override
  State<DateAndTimePicker> createState() => _DateAndTimePickerState();
}

class _DateAndTimePickerState extends State<DateAndTimePicker> {
  DateTime d = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: Row(
        children: [
          CustomButton(
            onPressed: () async {
              final result = await showBoardDateTimePicker(
                context: context,
                pickerType: DateTimePickerType.datetime,
                options: const BoardDateTimeOptions(
                  languages: BoardPickerLanguages(
                    locale: 'fr',
                    today: 'Aujourd’hui',
                    tomorrow: 'Demain',
                    now: 'Maintenant',
                  ),
                  startDayOfWeek: DateTime.sunday,
                  pickerFormat: PickerFormat.ymd,
                  pickerSubTitles: BoardDateTimeItemTitles(
                    year: 'Année',
                    month: 'Mois',
                    day: 'Jour',
                    hour: 'Heure',
                  ),
                ),
                onResult: (val) {},
              );
              if (result != null) {
                setState(() => d = result);
              }
            },
            title: 'Choisir La Date',
            backgroundColor: Colors.black.withOpacity(0.6),
            height: 35,
            width: 160,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              BoardDateFormat('yyyy/MM/dd HH:mm').format(d),
              style: Styles.normal14,
            ),
          ),
        ],
      ),
    );
  }
}
