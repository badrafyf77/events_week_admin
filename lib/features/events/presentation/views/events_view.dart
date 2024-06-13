import 'package:events_week_admin/core/utils/customs/loading_indicator.dart';
import 'package:events_week_admin/core/utils/helpers/show_toast.dart';
import 'package:events_week_admin/features/events/presentation/manager/set%20initial%20event%20bloc/set_initial_event_bloc.dart';
import 'package:events_week_admin/features/events/presentation/views/widgets/choose_and_add_event.dart';
import 'package:events_week_admin/features/events/presentation/views/widgets/events_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventsView extends StatefulWidget {
  const EventsView({super.key});

  @override
  State<EventsView> createState() => _EventsViewState();
}

class _EventsViewState extends State<EventsView> {
  bool loading1 = false;
  bool loading2 = false;
  @override
  void initState() {
    super.initState();
    transitionProblemSolutionProcess();
  }

  transitionProblemSolutionProcess() async {
    await Future.delayed(const Duration(milliseconds: 500), () {});
    setState(() {
      loading1 = true;
    });
    await Future.delayed(const Duration(milliseconds: 500), () {});
    setState(() {
      loading2 = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return loading1
        ? loading2
            ? BlocBuilder<SetInitialEventBloc, SetInitialEventState>(
                builder: (context, state) {
                  if (state is SetInitialEventLaoding) {
                    return const Center(child: CustomLoadingIndicator());
                  }
                  if (state is SetInitialEventFailure) {
                    myShowToastError(context, state.err);
                  }
                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        ChooseInitialAndAddEvent(),
                        SizedBox(
                          height: 12,
                        ),
                        EventsList(),
                      ],
                    ),
                  );
                },
              )
            : const CustomLoadingIndicator()
        : AnimatedContainer(
            duration: const Duration(milliseconds: 250),
          );
  }
}
