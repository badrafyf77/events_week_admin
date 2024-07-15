import 'package:events_week_admin/core/utils/assets.dart';
import 'package:events_week_admin/core/utils/colors.dart';
import 'package:events_week_admin/core/utils/customs/button.dart';
import 'package:events_week_admin/core/utils/customs/loading_indicator.dart';
import 'package:events_week_admin/core/utils/customs/refresh_icon.dart';
import 'package:events_week_admin/core/utils/styles.dart';
import 'package:flutter/material.dart';

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

class ActivitiesHeader extends StatelessWidget {
  const ActivitiesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomButton(
              onPressed: () {},
              title: "Ajouter une activité",
              backgroundColor: AppColors.kPrimaryColor,
              height: 38,
              width: 220,
            ),
            RefreshIcon(
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class ActivitiesBody extends StatelessWidget {
  const ActivitiesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return const ActivityCard();
          },
        ),
      ),
    );
  }
}

class ActivityCard extends StatelessWidget {
  const ActivityCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  AppAssets.event,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Théâtre pour enfants et adolescents",
                      style: Styles.normal24,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Cours de théâtre d'improvisation pour enfants et adolescents. 2 vendredis par mois cours enfants à 17h30 cours adolescents à 18h30",
                      style: Styles.normal16.copyWith(color: Colors.grey),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 8),
                    const Spacer(),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        EditActivity(),
                        SizedBox(width: 25),
                        DeleteActivity(),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EditActivity extends StatelessWidget {
  const EditActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.blue,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.edit,
          size: 22,
          color: Colors.white,
        ),
      ),
    );
  }
}

class DeleteActivity extends StatelessWidget {
  const DeleteActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.delete,
          size: 22,
          color: Colors.white,
        ),
      ),
    );
  }
}
