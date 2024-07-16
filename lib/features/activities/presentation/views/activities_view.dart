import 'package:events_week_admin/core/utils/customs/loading_indicator.dart';
import 'package:events_week_admin/features/activities/presentation/manager/activities%20cubit/activities_cubit.dart';
import 'package:events_week_admin/features/activities/presentation/views/widgets/activities_body.dart';
import 'package:events_week_admin/features/activities/presentation/views/widgets/activities_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActivitiesView extends StatefulWidget {
  const ActivitiesView({
    super.key,
  });

  @override
  State<ActivitiesView> createState() => _ActivitiesViewState();
}

class _ActivitiesViewState extends State<ActivitiesView> {
  bool loading1 = false;
  bool loading2 = false;
  @override
  void initState() {
    super.initState();
    transitionProblemSolutionProcess();
    BlocProvider.of<ActivitiesCubit>(context).getActivities();
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
            ? const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    ActivitiesHeader(),
                    SizedBox(
                      height: 15,
                    ),
                    ActivitiesBody(),
                  ],
                ),
              )
            : const CustomLoadingIndicator()
        : AnimatedContainer(
            duration: const Duration(milliseconds: 250),
          );
  }
}
