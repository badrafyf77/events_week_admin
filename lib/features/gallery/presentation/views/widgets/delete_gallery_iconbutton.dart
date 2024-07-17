import 'package:events_week_admin/features/gallery/data/model/gallery_model.dart';
import 'package:events_week_admin/features/gallery/presentation/manager/galleries%20cubit/galleries_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        onPressed: () {
          BlocProvider.of<GalleriesCubit>(context).deleteGallery(gallery);
        },
        icon: const Icon(
          Icons.delete,
          size: 22,
          color: Colors.white,
        ),
      ),
    );
  }
}
