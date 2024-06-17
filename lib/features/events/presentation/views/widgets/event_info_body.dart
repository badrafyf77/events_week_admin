import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:events_week_admin/core/models/event_model.dart';
import 'package:events_week_admin/core/utils/colors.dart';
import 'package:events_week_admin/core/utils/customs/cashed_network_image.dart';
import 'package:events_week_admin/core/utils/styles.dart';
import 'package:flutter/material.dart';

class EventInfoBody extends StatelessWidget {
  const EventInfoBody({
    super.key,
    required this.event,
  });

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 5,
            right: 5,
            top: 5,
            bottom: 25,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                event.title,
                style: Styles.normal24,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(
                    Icons.place,
                    color: AppColors.kPrimaryColor,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    event.place,
                    style: Styles.normal14.copyWith(
                      fontWeight: FontWeight.normal,
                      color: AppColors.kPrimaryColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  const Icon(
                    Icons.access_time,
                    color: AppColors.kPrimaryColor,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    BoardDateFormat('yyyy/MM/dd HH:mm')
                        .format(event.date.toDate()),
                    style: Styles.normal14.copyWith(
                      fontWeight: FontWeight.normal,
                      color: AppColors.kPrimaryColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                event.description,
                style: Styles.normal16.copyWith(
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EventPicture extends StatelessWidget {
  const EventPicture({
    super.key,
    required this.downloadUrl,
  });

  final String downloadUrl;

  @override
  Widget build(BuildContext context) {
    return CustomCashedNetworkImage(
      url: downloadUrl,
      height: 300,
      width: MediaQuery.of(context).size.width,
    );
  }
}
