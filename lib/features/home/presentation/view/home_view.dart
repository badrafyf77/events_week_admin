import 'package:flutter/material.dart';
import 'package:events_week_admin/features/home/presentation/view/widgets/home_body.dart';
import 'package:events_week_admin/features/home/presentation/view/widgets/home_header.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        HomeHeader(),
        HomeBody(),
      ],
    );
  }
}
