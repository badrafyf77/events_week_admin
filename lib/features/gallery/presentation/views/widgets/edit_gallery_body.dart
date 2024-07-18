import 'dart:io';

import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:events_week_admin/core/utils/colors.dart';
import 'package:events_week_admin/core/utils/customs/button.dart';
import 'package:events_week_admin/core/utils/customs/cashed_network_image.dart';
import 'package:events_week_admin/core/utils/customs/date_time_picker.dart';
import 'package:events_week_admin/core/utils/customs/text_field.dart';
import 'package:events_week_admin/core/utils/styles.dart';
import 'package:events_week_admin/features/gallery/data/model/gallery_model.dart';
import 'package:events_week_admin/features/gallery/presentation/manager/galleries%20cubit/galleries_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class EditGalleryBody extends StatefulWidget {
  const EditGalleryBody({super.key, required this.gallery});

  final Gallery gallery;

  @override
  State<EditGalleryBody> createState() => _EditGalleryBodyState();
}

class _EditGalleryBodyState extends State<EditGalleryBody> {
  TextEditingController titleController = TextEditingController();

  DateTime date = DateTime.now();

  bool oldImage = true;

  XFile? image;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  void initState() {
    titleController.text = widget.gallery.title;
    date = widget.gallery.date.toDate();
    super.initState();
  }

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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Image de l\'événement',
                            style: Styles.normal18,
                          ),
                          if (!oldImage)
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  oldImage = true;
                                });
                              },
                              icon: const Icon(Icons.rotate_left),
                              tooltip: 'Retour à l\'ancienne Image',
                            ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      (oldImage)
                          ? Column(
                              children: [
                                CustomCashedNetworkImage(
                                  url: widget.gallery.downloadUrl,
                                  height: 180,
                                  width: 250,
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      oldImage = false;
                                    });
                                  },
                                  icon: const Icon(Icons.delete),
                                ),
                              ],
                            )
                          : image == null
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
                                    ),
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
                    Gallery gallery = Gallery(
                        id: widget.gallery.id,
                        title: titleController.text,
                        date: Timestamp.fromDate(date),
                        downloadUrl: widget.gallery.downloadUrl,
                        height: widget.gallery.height,
                        width: widget.gallery.width,
                        );
                    BlocProvider.of<GalleriesCubit>(context).editGallery(
                      gallery,
                      widget.gallery.title,
                      oldImage,
                      image,
                    );
                    setState(() {
                      titleController.clear();
                      image = null;
                    });
                  }
                },
                title: "Éditer",
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
