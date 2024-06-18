import 'package:events_week_admin/core/utils/colors.dart';
import 'package:events_week_admin/features/events/presentation/manager/get%20events%20info%20cubit/get_events_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RefreshEvents extends StatelessWidget {
  const RefreshEvents({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        BlocProvider.of<GetEventsCubit>(context).getEventsCubit();
      },
      icon: const Icon(
        Icons.refresh,
        color: AppColors.kPrimaryColor,
      ),
    );
  }
}