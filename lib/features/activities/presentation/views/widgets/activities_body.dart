import 'package:events_week_admin/core/utils/helpers/show_toast.dart';
import 'package:events_week_admin/features/activities/data/model/activity_model.dart';
import 'package:events_week_admin/features/activities/presentation/manager/activities%20cubit/activities_cubit.dart';
import 'package:events_week_admin/features/activities/presentation/views/widgets/activity_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ActivitiesBody extends StatelessWidget {
  const ActivitiesBody({super.key});

  @override
  Widget build(BuildContext context) {
    Activity fakeActivity = Activity(
        id: 'id',
        title: 'title',
        description: 'description',
        downloadUrl: 'downloadUrl');
    return Expanded(
      child: BlocConsumer<ActivitiesCubit, ActivitiesState>(
        listener: (context, state) {
          if (state is ActivitiesFailure) {
            myShowToastError(context, state.err);
          }
        },
        builder: (context, state) {
          return ScrollConfiguration(
            behavior:
                ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: ListView.builder(
              itemCount: (state is GetActivitiesSuccess)
                  ? state.activitiesList.length
                  : 3,
              itemBuilder: (context, index) {
                return Skeletonizer(
                  enabled: (state is GetActivitiesSuccess) ? false : true,
                  child: ActivityCard(
                    activity: (state is GetActivitiesSuccess)
                        ? state.activitiesList[index]
                        : fakeActivity,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
