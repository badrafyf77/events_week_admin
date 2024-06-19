import 'package:events_week_admin/core/config/router.dart';
import 'package:events_week_admin/core/utils/customs/loading_indicator.dart';
import 'package:events_week_admin/features/home/presentation/manager/get%20events%20week%20info%20bloc/get_events_week_info_bloc.dart';
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
          BlocBuilder<GetEventsWeekInfoBloc, GetEventsWeekInfoState>(
            builder: (context, state) {
              if (state is GetEventsWeekInfoFailure) {
                return Center(
                    child: IconButton(
                        onPressed: () {
                          BlocProvider.of<GetEventsWeekInfoBloc>(context).add(
                            GetEventsWeekInfo(date: DateTime.now()),
                          );
                        },
                        icon: const Icon(Icons.refresh)));
              }
              if (state is GetEventsWeekInfoSuccess) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DashboardItem(
                          title: 'Total d\'événements',
                          nmbr: state.eventsWeekInfo.events,
                          onTap: () {
                            AppRouter.navigateTo(context, AppRouter.events);
                          },
                        ),
                        DashboardItem(
                          title: 'Total des messages',
                          nmbr: state.eventsWeekInfo.messages,
                          onTap: () {
                            AppRouter.navigateTo(context, AppRouter.messages);
                          },
                        ),
                        DashboardItem(
                          title: 'visites aujourd\'hui',
                          nmbr: state.eventsWeekInfo
                              .visitsList[DateTime.now().day - 1],
                          onTap: () {},
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SiteAnalytic(
                      date: DateTime.now(),
                      visitsList: state.eventsWeekInfo.visitsList,
                    ),
                  ],
                );
              }
              return const Center(child: CustomLoadingIndicator());
            },
          ),
        ],
      ),
    );
  }
}
