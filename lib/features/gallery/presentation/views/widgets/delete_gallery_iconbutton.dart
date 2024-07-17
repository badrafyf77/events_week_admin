import 'package:events_week_admin/features/gallery/data/model/gallery_model.dart';
import 'package:flutter/material.dart';

class DeleteGallery extends StatelessWidget {
  const DeleteGallery({super.key, required this.gallery});

  final Gallery gallery;

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
