import 'package:events_week_admin/core/utils/customs/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:events_week_admin/features/home/presentation/view/widgets/home_body.dart';
import 'package:events_week_admin/features/home/presentation/view/widgets/home_header.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    super.key,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool loading1 = false;
  bool loading2 = false;
  @override
  void initState() {
    super.initState();
    transitionProblemSolutionProcess();
  }

  transitionProblemSolutionProcess() async {
    await Future.delayed(const Duration(milliseconds: 500), () {});
    setState(() {
      loading1 = true;
    });
    await Future.delayed(const Duration(seconds: 1), () {});
    setState(() {
      loading2 = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return loading1
        ? loading2
            ? const Column(
                children: [
                  HomeHeader(),
                  HomeBody(),
                ],
              )
            : const CustomLoadingIndicator()
        : AnimatedContainer(
            duration: const Duration(milliseconds: 250),
          );
  }
}