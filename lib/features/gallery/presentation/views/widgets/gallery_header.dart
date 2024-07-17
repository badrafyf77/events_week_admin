import 'package:events_week_admin/core/config/router.dart';
import 'package:events_week_admin/core/utils/colors.dart';
import 'package:events_week_admin/core/utils/customs/button.dart';
import 'package:events_week_admin/core/utils/customs/refresh_icon.dart';
import 'package:events_week_admin/features/gallery/presentation/manager/galleries%20cubit/galleries_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              onPressed: () {
                BlocProvider.of<GalleriesCubit>(context).getGalleries();
              },
            ),
          ],
        ),
      ),
    );
  }
}
