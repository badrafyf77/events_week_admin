import 'dart:io';

import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:events_week_admin/core/utils/colors.dart';
import 'package:events_week_admin/core/utils/customs/button.dart';
import 'package:events_week_admin/core/utils/customs/date_time_picker.dart';
import 'package:events_week_admin/core/utils/customs/text_field.dart';
import 'package:events_week_admin/core/utils/styles.dart';
import 'package:events_week_admin/features/gallery/presentation/manager/galleries%20cubit/galleries_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class AddGalleryBody extends StatefulWidget {
  const AddGalleryBody({super.key});

  @override
  State<AddGalleryBody> createState() => _AddGalleryBodyState();
}

class _AddGalleryBodyState extends State<AddGalleryBody> {
  TextEditingController titleController = TextEditingController();

  DateTime date = DateTime.now();

  XFile? image;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              height: 270,
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
                        height: 15,
                      ),
                      Text(
                        'Titre de galerie',
                        style: Styles.normal15,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      MyTextField(
                        controller: titleController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Entrer le titre';
                          }
                          return null;
                        },
                        hintText: 'Titre',
                        width: constraints.maxWidth,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomDateAndTimePicker(
                        height: 30,
                        width: constraints.maxWidth,
                        date: date,
                        onPressed: () async {
                          final result = await showBoardDateTimePicker(
                            context: context,
                            initialDate: date,
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
                            setState(() => date = result);
                          }
                        },
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
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Text(
                        'Image de galerie',
                        style: Styles.normal18,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      image == null
                          ? InkWell(
                              onTap: () async {
                                try {
                                  final ImagePicker picker = ImagePicker();
                                  image = await picker.pickImage(
                                      source: ImageSource.gallery);
                                  setState(() {});
                                  // ignore: empty_catches
                                } catch (e) {}
                              },
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: const BoxDecoration(
                                  color: Colors.black,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          : Column(
                              children: [
                                Image.file(
                                  File(image!.path),
                                  fit: BoxFit.fill,
                                  height: 180,
                                  width: 250,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      image = null;
                                    });
                                  },
                                  icon: const Icon(Icons.delete),
                                )
                              ],
                            ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    BlocProvider.of<GalleriesCubit>(context).addGallery(
                      titleController.text,
                      date,
                      image,
                    );
                    setState(() {
                      titleController.clear();
                      image = null;
                    });
                  }
                },
                title: "Ajouter",
                backgroundColor: AppColors.kPrimaryColor,
                height: 35,
                width: 130,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
