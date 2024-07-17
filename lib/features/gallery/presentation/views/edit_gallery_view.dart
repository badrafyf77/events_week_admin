import 'package:events_week_admin/core/config/router.dart';
import 'package:events_week_admin/features/gallery/presentation/views/widgets/edit_gallery_body.dart';
import 'package:events_week_admin/features/messages/presentation/views/widgets/navigate_back_icon.dart';
import 'package:flutter/material.dart';

class EditGalleryView extends StatelessWidget {
  const EditGalleryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NavigateBackIcon(
            title: 'Éditer galerie xxxxxx',
            onPressed: () {
              AppRouter.navigateTo(context, AppRouter.galleries);
            },
          ),
          const SizedBox(
            height: 20,
          ),
          const EditGalleryBody(),
        ],
      ),
    );
  }
}
