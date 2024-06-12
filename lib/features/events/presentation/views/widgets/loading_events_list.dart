import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:events_week_admin/core/models/event_model.dart';
import 'package:events_week_admin/features/events/presentation/views/widgets/event_item.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomEventsListLoading extends StatelessWidget {
  const CustomEventsListLoading({super.key});

  @override
  Widget build(BuildContext context) {
    Event e1 = Event(
      id: 'kns',
      title: 'jsjjsws',
      description:
          'Ut et reprehenderit irure labore aute sit irure magna anim est minim do. Sunt cillum eu quis sint dolore commodo laboris commodo cillum aliquip dolor. Velit pariatur mollit irure ad eiusmod voluptate eiusmod Lorem officia excepteur exercitation. Anim eiusmod ullamco anim cillum in. Nisi id quis ea cupidatat occaecat culpa amet ullamco mollit in magna nostrud.',
      place: 'fake, fakee',
      downloadUrl: 'downloadUrl',
      date: Timestamp.now(),
    );
    List<Event> fakeEventsList = [e1, e1];
    return Skeletonizer(
      enabled: true,
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: ListView.builder(
          itemCount: fakeEventsList.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                EventItem(
                  event: fakeEventsList[index],
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
