import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:events_week_admin/core/utils/helpers/show_toast.dart';
import 'package:events_week_admin/features/gallery/data/model/gallery_model.dart';
import 'package:events_week_admin/features/gallery/presentation/manager/galleries%20cubit/galleries_cubit.dart';
import 'package:events_week_admin/features/gallery/presentation/views/widgets/gallery_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class GalleryBody extends StatelessWidget {
  const GalleryBody({super.key});

  @override
  Widget build(BuildContext context) {
    Gallery fakeGallery = Gallery(
      id: 'id',
      title: 'title',
      date: Timestamp.now(),
      downloadUrl: 'downloadUrl',
      height: 200,
      width: 200,
    );
    return BlocConsumer<GalleriesCubit, GalleriesState>(
      listener: (context, state) {
        if (state is GalleriesFailure) {
          myShowToastError(context, state.err);
        }
        if (state is GalleriesSuccess) {
          myShowToastSuccess(context, state.msg);
        }
      },
      builder: (context, state) {
        return Expanded(
          child: ScrollConfiguration(
            behavior:
                ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: ListView.builder(
              itemCount: (state is GetGalleriesSuccess)
                  ? state.galleriesList.length
                  : 3,
              itemBuilder: (context, index) {
                return Skeletonizer(
                  enabled: (state is GetGalleriesSuccess) ? false : true,
                  child: GalleryCard(
                    gallery: (state is GetGalleriesSuccess)
                        ? state.galleriesList[index]
                        : fakeGallery,
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
