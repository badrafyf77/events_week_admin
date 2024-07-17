import 'package:events_week_admin/features/events/data/model/event_model.dart';
import 'package:events_week_admin/core/utils/customs/loading_indicator.dart';
import 'package:events_week_admin/core/utils/helpers/show_toast.dart';
import 'package:events_week_admin/features/events/presentation/manager/delete%20event%20bloc/delete_event_bloc.dart';
import 'package:events_week_admin/features/events/presentation/manager/get%20events%20info%20cubit/get_events_cubit.dart';
import 'package:events_week_admin/features/events/presentation/views/widgets/event_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventsListViewBuilder extends StatelessWidget {
  const EventsListViewBuilder({
    super.key,
    required this.itemsList,
  });

  final List<Event> itemsList;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeleteEventBloc, DeleteEventState>(
      listener: (context, state) {
        if (state is DeleteEventFailure) {
          myShowToastError(context, state.err);
        }
        if (state is DeleteEventSuccess) {
          myShowToastSuccess(context, state.msg);
          BlocProvider.of<GetEventsCubit>(context).getEventsCubit();
        }
      },
      builder: (context, state) {
        if (state is DeleteEventLoading) {
          return const Center(
            child: CustomLoadingIndicator(),
          );
        }
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
      },
    );
  }
}
