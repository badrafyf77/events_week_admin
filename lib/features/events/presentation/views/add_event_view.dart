import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:events_week_admin/core/config/router.dart';
import 'package:events_week_admin/core/utils/colors.dart';
import 'package:events_week_admin/core/utils/customs/button.dart';
import 'package:events_week_admin/core/utils/styles.dart';
import 'package:flutter/material.dart';

class AddEventView extends StatelessWidget {
  const AddEventView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AddEventHeader();
  }
}

class AddEventHeader extends StatelessWidget {
  const AddEventHeader({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  AppRouter.navigateTo(context, AppRouter.events);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  size: 40,
                ),
              ),
              Text(
                'Ajouter Un Nouvel Événement',
                style: Styles.normal20,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
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
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  Container(
                    height: 340,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomButton(
                    onPressed: () {},
                    title: "Ajouter",
                    backgroundColor: AppColors.kPrimaryColor,
                    height: 35,
                    width: 130,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    this.isTextArea = false,
    required this.controller,
    required this.validator,
    required this.hintText,
    required this.width,
  });

  final bool isTextArea;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String hintText;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
        maxLines: isTextArea ? 5 : 1,
        controller: controller,
        validator: validator,
        style: Styles.normal16.copyWith(
          color: AppColors.kPrimaryColor,
        ),
        cursorColor: AppColors.kPrimaryColor,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: Styles.normal16.copyWith(
            color: Colors.grey[800],
            fontWeight: FontWeight.normal,
          ),
          filled: true,
          fillColor: Colors.grey[200],
          errorStyle: const TextStyle(
            color: Colors.red,
            fontSize: 12,
            height: 0,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1.5,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}

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
