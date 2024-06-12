import 'package:events_week_admin/core/utils/customs/listview_builder.dart';
import 'package:events_week_admin/core/utils/helpers/show_toast.dart';
import 'package:events_week_admin/features/events/presentation/manager/get%20events/get_events_cubit.dart';
import 'package:events_week_admin/features/events/presentation/views/widgets/loading_events_list.dart';
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
    return Expanded(
      child: BlocBuilder<GetEventsCubit, GetEventsState>(
        builder: (context, state) {
          if (state is GetEventsSuccess) {
            if (state.eventsList.isEmpty) {
              return const Icon(Icons.error);
            }
            return CustomListViewBuilder(
              itemsList: state.eventsList,
            );
          }
          if (state is GetEventsFailure) {
            myShowToastError(context, state.err);
          }
          return const CustomEventsListLoading();
        },
      ),
    );
  }
}

