import 'dart:io';
import 'package:events_week_admin/core/utils/colors.dart';
import 'package:events_week_admin/core/utils/customs/button.dart';
import 'package:events_week_admin/core/utils/customs/date_time_picker.dart';
import 'package:events_week_admin/core/utils/customs/text_field.dart';
import 'package:events_week_admin/core/utils/show_toast.dart';
import 'package:events_week_admin/core/utils/styles.dart';
import 'package:events_week_admin/features/events/presentation/manager/bloc/add_event_bloc.dart';
import 'package:events_week_admin/features/events/presentation/views/widgets/add_event_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class AddEventView extends StatelessWidget {
  const AddEventView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddEventBloc, AddEventState>(
      listener: (context, state) {
        if (state is AddEventFailure) {
          myShowToastError(context, state.err);
        }
        if (state is AddEventSuccess) {
          myShowToastSuccess(context, state.msg);
        }
      },
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AddEventHeader(),
            SizedBox(
              height: 20,
            ),
            AddEventBody(),
          ],
        ),
      ),
    );
  }
}

class AddEventBody extends StatefulWidget {
  const AddEventBody({
    super.key,
  });

  @override
  State<AddEventBody> createState() => _AddEventBodyState();
}

class _AddEventBodyState extends State<AddEventBody> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController placeController = TextEditingController();
  DateTime date = DateTime.now();

  XFile? image;
  @override
  Widget build(BuildContext context) {
    return Row(
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
                      controller: titleController,
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
                      controller: descriptionController,
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
                      controller: placeController,
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
                      date: date,
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
                      'Image de L\'événement',
                      style: Styles.normal18,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    image == null
                        ? InkWell(
                            onTap: () async {
                              final ImagePicker picker = ImagePicker();
                              image = await picker.pickImage(
                                  source: ImageSource.gallery);
                              setState(() {});
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
                        : Image.file(
                            File(image!.path),
                            fit: BoxFit.fill,
                            height: 180,
                            width: 250,
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
                BlocProvider.of<AddEventBloc>(context).add(
                  AddEvent(
                    title: titleController.text,
                    description: descriptionController.text,
                    place: placeController.text,
                    date: date,
                    image: image,
                  ),
                );
              },
              title: "Ajouter",
              backgroundColor: AppColors.kPrimaryColor,
              height: 35,
              width: 130,
            ),
          ],
        ),
      ],
    );
  }
}
