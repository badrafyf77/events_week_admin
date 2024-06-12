import 'package:events_week_admin/core/utils/customs/loading_indicator.dart';
import 'package:events_week_admin/core/utils/helpers/show_toast.dart';
import 'package:events_week_admin/features/events/presentation/manager/get%20events/get_events_cubit.dart';
import 'package:events_week_admin/features/events/presentation/views/widgets/choose_initial_event.dart';
import 'package:events_week_admin/features/events/presentation/views/widgets/navigate_to_add_event_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChooseInitialAndAddEvent extends StatelessWidget {
  const ChooseInitialAndAddEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: BlocConsumer<GetEventsCubit, GetEventsState>(
        listener: (context, state) {
          if (state is GetEventsFailure) {
            myShowToastError(context, state.err);
          }
        },
        builder: (context, state) {
          if (state is GetEventsSuccess) {
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ChooseInitialEvent(
                    eventsList: state.eventsList,
                  ),
                  const NavigateToAddEventButton(),
                ],
              ),
            );
          }
          return const CustomLoadingIndicator(
            height: 50,
          );
        },
      ),
    );
  }
}
