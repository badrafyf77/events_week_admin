import 'package:events_week_admin/core/utils/customs/date_time_picker.dart';
import 'package:events_week_admin/core/utils/customs/text_field.dart';
import 'package:events_week_admin/core/utils/styles.dart';
import 'package:flutter/material.dart';

class AddEventLeftSide extends StatefulWidget {
  const AddEventLeftSide({
    super.key,
  });

  @override
  State<AddEventLeftSide> createState() => _AddEventLeftSideState();
}

class _AddEventLeftSideState extends State<AddEventLeftSide> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 520,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: LayoutBuilder(builder: (context, constraints) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Informations Générales',
                  style: Styles.normal18,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Titre De L\'événement',
                  style: Styles.normal15,
                ),
                const SizedBox(
                  height: 8,
                ),
                MyTextField(
                  controller: controller,
                  validator: (value) {
                    return;
                  },
                  hintText: 'Titre',
                  width: constraints.maxWidth,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Description De L\'événement',
                  style: Styles.normal15,
                ),
                const SizedBox(
                  height: 8,
                ),
                MyTextField(
                  isTextArea: true,
                  controller: controller,
                  validator: (value) {
                    return;
                  },
                  hintText: 'Description',
                  width: constraints.maxWidth,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Lieu De L\'événement',
                  style: Styles.normal15,
                ),
                const SizedBox(
                  height: 8,
                ),
                MyTextField(
                  controller: controller,
                  validator: (value) {
                    return;
                  },
                  hintText: 'Lieu',
                  width: constraints.maxWidth,
                ),
                const SizedBox(
                  height: 15,
                ),
                DateAndTimePicker(
                  height: 40,
                  width: constraints.maxWidth,
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
