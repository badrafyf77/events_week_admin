import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:events_week_admin/core/config/router.dart';
import 'package:events_week_admin/core/models/event_model.dart';
import 'package:events_week_admin/core/utils/colors.dart';
import 'package:events_week_admin/core/utils/customs/animated_container.dart';
import 'package:events_week_admin/core/utils/customs/button.dart';
import 'package:events_week_admin/core/utils/images.dart';
import 'package:events_week_admin/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
                  child: CachedNetworkImage(
                    imageUrl: event.downloadUrl,
                    width: constraints.maxWidth * .35,
                    placeholder: (context, url) => Skeletonizer(
                        enabled: true, child: Image.asset(AppImages.event)),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
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
                                AppRouter.navigateTo(
                                    context, AppRouter.eventInfo, 2);
                              },
                              title: 'Voir Plus',
                              backgroundColor: AppColors.kPrimaryColor,
                              height: 35,
                              width: 120,
                            ),
                          )
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
