import 'dart:io';

import 'package:events_week_admin/core/utils/colors.dart';
import 'package:events_week_admin/core/utils/customs/button.dart';
import 'package:events_week_admin/core/utils/customs/text_field.dart';
import 'package:events_week_admin/core/utils/styles.dart';
import 'package:events_week_admin/features/activities/presentation/manager/activities%20cubit/activities_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class AddActivityBody extends StatefulWidget {
  const AddActivityBody({
    super.key,
  });

  @override
  State<AddActivityBody> createState() => _AddActivityBodyState();
}

class _AddActivityBodyState extends State<AddActivityBody> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  XFile? image;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    descriptionController.dispose();
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
              height: 400,
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
                        'Titre de l\'activité',
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
                      Text(
                        'Description de l\'activité',
                        style: Styles.normal15,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      MyTextField(
                        isTextArea: true,
                        controller: descriptionController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Entrer la description';
                          }
                          return null;
                        },
                        hintText: 'Description',
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
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Text(
                        'Image de l\'activité',
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
                    BlocProvider.of<ActivitiesCubit>(context).addActivity(
                      titleController.text,
                      descriptionController.text,
                      image,
                    );
                    setState(() {
                      titleController.clear();
                      descriptionController.clear();
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
