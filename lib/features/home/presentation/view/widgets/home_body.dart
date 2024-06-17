import 'package:events_week_admin/core/config/router.dart';
import 'package:events_week_admin/core/utils/customs/loading_indicator.dart';
import 'package:events_week_admin/features/home/presentation/manager/get%20events%20week%20info%20cubit/get_events_week_info_cubit.dart';
import 'package:events_week_admin/features/home/presentation/view/widgets/analytic.dart';
import 'package:events_week_admin/features/home/presentation/view/widgets/home_body_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          BlocBuilder<EventsWeekInfoCubit, EventsWeekInfoState>(
            builder: (context, state) {
              if (state is EventsWeekInfoSuccess) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DashboardItem(
                      title: 'Total d\'événements',
                      nmbr: state.eventsWeekInfo.events,
                      onTap: () {
                        AppRouter.navigateTo(context, AppRouter.events, 2);
                      },
                    ),
                    DashboardItem(
                      title: 'Total des messages',
                      nmbr: state.eventsWeekInfo.messages,
                      onTap: () {
                        AppRouter.navigateTo(context, AppRouter.messages, 3);
                      },
                    ),
                    DashboardItem(
                      title: 'visites aujourd\'hui',
                      nmbr: 352,
                      onTap: () {},
                    ),
                  ],
                );
              }
              return const Center(child: CustomLoadingIndicator());
            },
          ),
          const SizedBox(
            height: 20,
          ),
          const SiteAnalytic(),
        ],
      ),
    );
  }
}
