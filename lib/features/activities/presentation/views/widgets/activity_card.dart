import 'package:events_week_admin/core/utils/assets.dart';
import 'package:events_week_admin/core/utils/styles.dart';
import 'package:events_week_admin/features/activities/presentation/views/widgets/delete_activity_iconbutton.dart';
import 'package:events_week_admin/features/activities/presentation/views/widgets/edit_activity_iconbutton.dart';
import 'package:flutter/material.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard({super.key});

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
                child: Image.asset(
                  AppAssets.event,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Théâtre pour enfants et adolescents",
                      style: Styles.normal24,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Cours de théâtre d'improvisation pour enfants et adolescents. 2 vendredis par mois cours enfants à 17h30 cours adolescents à 18h30",
                      style: Styles.normal16.copyWith(color: Colors.grey),
                      textAlign: TextAlign.justify,
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