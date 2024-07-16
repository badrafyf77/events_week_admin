import 'package:events_week_admin/core/utils/customs/cashed_network_image.dart';
import 'package:events_week_admin/core/utils/styles.dart';
import 'package:events_week_admin/features/activities/data/model/activity_model.dart';
import 'package:events_week_admin/features/activities/presentation/views/widgets/delete_activity_iconbutton.dart';
import 'package:events_week_admin/features/activities/presentation/views/widgets/edit_activity_iconbutton.dart';
import 'package:flutter/material.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard({super.key, required this.activity});

  final Activity activity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CustomCashedNetworkImage(
                  url: activity.downloadUrl,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      activity.title,
                      style: Styles.normal24,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      activity.description,
                      style: Styles.normal16.copyWith(color: Colors.grey),
                      textAlign: TextAlign.justify,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                    ),
                    const SizedBox(height: 8),
                    const Spacer(),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        EditActivity(),
                        SizedBox(width: 25),
                        DeleteActivity(),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
