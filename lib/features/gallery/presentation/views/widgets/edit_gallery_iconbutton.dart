import 'package:events_week_admin/core/config/router.dart';
import 'package:flutter/material.dart';

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
        onPressed: () {
          AppRouter.navigateTo(context, AppRouter.editGallery);
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