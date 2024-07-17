import 'package:events_week_admin/core/config/router.dart';
import 'package:events_week_admin/core/utils/customs/loading_indicator.dart';
import 'package:events_week_admin/core/utils/helpers/show_toast.dart';
import 'package:events_week_admin/features/events/presentation/manager/add%20event%20bloc/add_event_bloc.dart';
import 'package:events_week_admin/features/events/presentation/views/widgets/add_event_body.dart';
import 'package:events_week_admin/features/messages/presentation/views/widgets/navigate_back_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddEventView extends StatelessWidget {
  const AddEventView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddEventBloc, AddEventState>(
      listener: (context, state) {
        if (state is AddEventFailure) {
          myShowToastError(context, state.err);
        }
        if (state is AddEventSuccess) {
          myShowToastSuccess(context, state.msg);
          AppRouter.navigateTo(context, AppRouter.events);
        }
      },
      builder: (context, state) {
        if (state is AddEventLaoding) {
          return const Center(child: CustomLoadingIndicator());
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NavigateBackIcon(
                title: 'Ajouter un événement',
                onPressed: () {
                  AppRouter.navigateTo(context, AppRouter.events);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const AddEventBody(),
            ],
          ),
        );
      },
    );
  }
}
