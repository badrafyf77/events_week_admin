import 'package:events_week_admin/core/config/router.dart';
import 'package:events_week_admin/core/utils/assets.dart';
import 'package:events_week_admin/core/utils/colors.dart';
import 'package:events_week_admin/core/utils/customs/button.dart';
import 'package:events_week_admin/core/utils/customs/loading_indicator.dart';
import 'package:events_week_admin/core/utils/customs/refresh_icon.dart';
import 'package:events_week_admin/core/utils/styles.dart';
import 'package:flutter/material.dart';

class GalleryView extends StatefulWidget {
  const GalleryView({
    super.key,
  });

  @override
  State<GalleryView> createState() => _GalleryViewState();
}

class _GalleryViewState extends State<GalleryView> {
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
                    GalleryHeader(),
                    SizedBox(
                      height: 15,
                    ),
                    GalleryBody(),
                  ],
                ),
              )
            : const CustomLoadingIndicator()
        : AnimatedContainer(
            duration: const Duration(milliseconds: 250),
          );
  }
}

class GalleryHeader extends StatelessWidget {
  const GalleryHeader({super.key});

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
              onPressed: () {
                AppRouter.navigateTo(context, AppRouter.addGallery);
              },
              title: "Ajouter une galerie",
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

class GalleryBody extends StatelessWidget {
  const GalleryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return const GalleryCard();
          },
        ),
      ),
    );
  }
}

class GalleryCard extends StatelessWidget {
  const GalleryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: 450,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: LayoutBuilder(builder: (context, constraints) {
          return Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    AppAssets.event,
                    width: constraints.maxWidth * 0.55,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Théâtre pour enfants et adolescents",
                        style: Styles.normal24,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "18/05/2023",
                        style: Styles.normal16.copyWith(color: Colors.grey),
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 8),
                      const Spacer(),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          EditGallery(),
                          SizedBox(width: 25),
                          DeleteGallery(),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class EditGallery extends StatelessWidget {
  const EditGallery({super.key});

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

class DeleteGallery extends StatelessWidget {
  const DeleteGallery({super.key});

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
