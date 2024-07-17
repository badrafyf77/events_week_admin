import 'package:events_week_admin/core/config/router.dart';
import 'package:events_week_admin/features/gallery/data/model/gallery_model.dart';
import 'package:flutter/material.dart';

class EditGallery extends StatelessWidget {
  const EditGallery({super.key, required this.gallery});

  final Gallery gallery;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.blue,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: () {
          AppRouter.navigateToWithExtra(context, AppRouter.editGallery,gallery);
        },
        icon: const Icon(
          Icons.edit,
          size: 22,
          color: Colors.white,
        ),
      ),
    );
  }
}
