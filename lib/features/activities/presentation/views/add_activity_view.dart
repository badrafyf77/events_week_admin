import 'package:events_week_admin/core/config/router.dart';
import 'package:events_week_admin/core/utils/customs/loading_indicator.dart';
import 'package:events_week_admin/core/utils/helpers/show_toast.dart';
import 'package:events_week_admin/features/activities/presentation/manager/activities%20cubit/activities_cubit.dart';
import 'package:events_week_admin/features/activities/presentation/views/widgets/add_activity_body.dart';
import 'package:events_week_admin/features/messages/presentation/views/widgets/navigate_back_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddActivityView extends StatelessWidget {
  const AddActivityView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ActivitiesCubit, ActivitiesState>(
      listener: (context, state) {
        if (state is ActivitiesFailure) {
          myShowToastError(context, state.err);
        }
        if (state is ActivitiesSuccess) {
          myShowToastSuccess(context, state.msg);
          AppRouter.navigateTo(context, AppRouter.activities);
        }
      },
      builder: (context, state) {
        if (state is ActivitiesLaoding) {
          return const Center(
            child: CustomLoadingIndicator(),
          );
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NavigateBackIcon(
                title: 'Ajouter une activité',
                onPressed: () {
                  AppRouter.navigateTo(context, AppRouter.activities);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const AddActivityBody(),
            ],
          ),
        );
      },
    );
  }
}
