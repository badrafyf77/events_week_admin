import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:events_week_admin/core/utils/customs/cashed_network_image.dart';
import 'package:events_week_admin/core/utils/styles.dart';
import 'package:events_week_admin/features/gallery/data/model/gallery_model.dart';
import 'package:events_week_admin/features/gallery/presentation/views/widgets/delete_gallery_iconbutton.dart';
import 'package:events_week_admin/features/gallery/presentation/views/widgets/edit_gallery_iconbutton.dart';
import 'package:flutter/material.dart';

class GalleryCard extends StatelessWidget {
  const GalleryCard({super.key, required this.gallery});

  final Gallery gallery;

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
                child: CustomCashedNetworkImage(
                  url: gallery.downloadUrl,
                  width: constraints.maxWidth * 0.55,
                ),
              ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        gallery.title,
                        style: Styles.normal24,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        BoardDateFormat('yyyy/MM/dd').format(gallery.date.toDate()),
                        style: Styles.normal16.copyWith(color: Colors.grey),
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 8),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          EditGallery(
                            gallery: gallery,
                          ),
                          const SizedBox(width: 25),
                          DeleteGallery(
                            gallery: gallery,
                          ),
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
