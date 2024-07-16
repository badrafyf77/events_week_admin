import 'package:events_week_admin/features/gallery/presentation/views/widgets/gallery_card.dart';
import 'package:flutter/material.dart';

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
