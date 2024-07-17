// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:events_week_admin/features/events/presentation/views/widgets/delete_event_iconbutton.dart';
import 'package:events_week_admin/features/events/presentation/views/widgets/edit_event_iconbutton.dart';
import 'package:flutter/material.dart';
import 'package:events_week_admin/core/config/router.dart';
import 'package:events_week_admin/features/events/data/model/event_model.dart';
import 'package:events_week_admin/core/utils/colors.dart';
import 'package:events_week_admin/core/utils/customs/animated_container.dart';
import 'package:events_week_admin/core/utils/customs/button.dart';
import 'package:events_week_admin/core/utils/customs/cashed_network_image.dart';
import 'package:events_week_admin/core/utils/styles.dart';

class EventDetails extends StatelessWidget {
  const EventDetails({
    super.key,
    required this.event,
  });

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(builder: (context, constraints) {
        return Container(
          height: 242,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: CustomCashedNetworkImage(
                    url: event.downloadUrl,
                    width: constraints.maxWidth * .35,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: constraints.maxWidth * .57,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 40,
                        child: Text(
                          event.title,
                          style: Styles.normal24,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 90,
                        child: Text(
                          event.description,
                          style: Styles.normal16.copyWith(
                              color: Colors.grey,
                              fontWeight: FontWeight.normal),
                          maxLines: 4,
                          textAlign: TextAlign.justify,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: constraints.maxWidth * 0.24,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.access_time,
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      BoardDateFormat('HH:mm a')
                                          .format(event.date.toDate()),
                                      style: Styles.normal12,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.place,
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      event.place,
                                      style: Styles.normal12,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          CustomAnimatedContainer(
                            child: CustomButton(
                              onPressed: () {
                                AppRouter.navigateToWithExtra(
                                    context, AppRouter.eventInfo, event);
                              },
                              title: 'Voir Plus',
                              backgroundColor: AppColors.kPrimaryColor,
                              height: 35,
                              width: 120,
                            ),
                          ),
                          EditEventIconButton(
                            event: event,
                          ),
                          DeleteEventIconButton(
                            event: event,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}