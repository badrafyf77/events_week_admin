import 'package:events_week_admin/core/utils/customs/loading_indicator.dart';
import 'package:events_week_admin/core/utils/show_toast.dart';
import 'package:events_week_admin/features/events/presentation/manager/get%20events/get_events_cubit.dart';
import 'package:events_week_admin/features/events/presentation/views/widgets/event_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            child: ScrollConfiguration(
              behavior:
                  ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: ListView.builder(
                itemCount: state.eventsList.length,
                itemBuilder: (context, index) {
                  return const Column(
                    children: [
                      EventItem(),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  );
                },
              ),
            ),
          );
        }
        if (state is GetEventsFailure) {
          myShowToastError(context, state.err);
        }
        return const Center(child: CustomLoadingIndicator());
      },
    );
  }
}
