import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:events_week_admin/core/models/event_model.dart';
import 'package:events_week_admin/core/utils/helpers/show_toast.dart';
import 'package:events_week_admin/features/events/presentation/manager/get%20events/get_events_cubit.dart';
import 'package:events_week_admin/features/events/presentation/views/widgets/event_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class EventsList extends StatefulWidget {
  const EventsList({
    super.key,
  });

  @override
  State<EventsList> createState() => _EventsListState();
}

class _EventsListState extends State<EventsList> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetEventsCubit>(context).getEventsCubit();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetEventsCubit, GetEventsState>(
      builder: (context, state) {
        if (state is GetEventsSuccess) {
          return Expanded(
            child: CustomListViewBuilder(
              itemsList: state.eventsList,
            ),
          );
        }
        if (state is GetEventsFailure) {
          myShowToastError(context, state.err);
        }
        return const Expanded(child: CustomEventsListLoading());
      },
    );
  }
}

class CustomListViewBuilder extends StatelessWidget {
  const CustomListViewBuilder({
    super.key,
    required this.itemsList,
  });

  final List<Event> itemsList;

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: ListView.builder(
        itemCount: itemsList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              EventItem(
                event: itemsList[index],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          );
        },
      ),
    );
  }
}

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
