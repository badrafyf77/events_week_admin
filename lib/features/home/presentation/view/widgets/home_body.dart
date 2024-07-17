// ignore_for_file: unused_import

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
    return BlocBuilder<GetEventsWeekInfoBloc, GetEventsWeekInfoState>(
      builder: (context, state) {
        if (state is GetEventsWeekInfoFailure) {
          return Center(
            child: IconButton(
              onPressed: () {
                BlocProvider.of<GetEventsWeekInfoBloc>(context).add(
                  GetEventsWeekInfo(date: DateTime.now()),
                );
              },
              icon: const Icon(Icons.refresh),
            ),
          );
        }
        if (state is GetEventsWeekInfoSuccess) {
          return ScrollConfiguration(
            behavior:
                ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: ListView(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DashboardItem(
                            title: 'Total d\'événements',
                            nmbr: state.eventsWeekInfo.events,
                            onTap: () {},
                          ),
                          DashboardItem(
                            title: 'Total des messages',
                            nmbr: state.eventsWeekInfo.messages,
                            onTap: () {},
                          ),
                          DashboardItem(
                            title: 'visites aujourd\'hui',
                            nmbr: state.eventsWeekInfo.visitsToday,
                            onTap: () {},
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DashboardItem(
                            title: 'Total d\'activités proposées',
                            nmbr: state.eventsWeekInfo.activities,
                            onTap: () {},
                          ),
                          DashboardItem(
                            title: 'Galerie',
                            nmbr: state.eventsWeekInfo.galleries,
                            onTap: () {},
                          ),
                          const SizedBox(
                            height: 100,
                            width: 270,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      SiteAnalytic(
                        date: state.eventsWeekInfo.date,
                        visitsList: state.eventsWeekInfo.visitsList,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
          // return Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          //   child: ListView(
          //     children: [

          //     ],
          //   ),
          // );
        }
        return const Center(child: CustomLoadingIndicator());
      },
    );
  }
}
