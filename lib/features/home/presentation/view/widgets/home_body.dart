import 'package:events_week_admin/core/config/router.dart';
import 'package:events_week_admin/core/utils/customs/loading_indicator.dart';
import 'package:events_week_admin/features/home/presentation/manager/count%20events%20cubit/count_events_cubit.dart';
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
          BlocBuilder<CountEventsCubit, CountEventsState>(
            builder: (context, state) {
              if (state is CountEventsSuccess) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DashboardItem(
                      title: 'Total d\'événements',
                      nmbr: state.eventsNumber,
                      onTap: () {
                        AppRouter.navigateTo(context, AppRouter.events, 2);
                      },
                    ),
                    DashboardItem(
                      title: 'Total des messages',
                      nmbr: 12,
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
