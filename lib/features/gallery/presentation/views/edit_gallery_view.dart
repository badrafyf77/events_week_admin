import 'package:events_week_admin/core/config/router.dart';
import 'package:events_week_admin/core/utils/customs/loading_indicator.dart';
import 'package:events_week_admin/core/utils/helpers/show_toast.dart';
import 'package:events_week_admin/features/gallery/data/model/gallery_model.dart';
import 'package:events_week_admin/features/gallery/presentation/manager/galleries%20cubit/galleries_cubit.dart';
import 'package:events_week_admin/features/gallery/presentation/views/widgets/edit_gallery_body.dart';
import 'package:events_week_admin/features/messages/presentation/views/widgets/navigate_back_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditGalleryView extends StatelessWidget {
  const EditGalleryView({super.key, required this.gallery});

  final Gallery gallery;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GalleriesCubit, GalleriesState>(
      listener: (context, state) {
        if (state is GalleriesFailure) {
          myShowToastError(context, state.err);
        }
        if (state is GalleriesSuccess) {
          myShowToastSuccess(context, state.msg);
          AppRouter.navigateTo(context, AppRouter.galleries);
        }
      },
      builder: (context, state) {
        if (state is GalleriesLoading) {
          return const Center(
            child: CustomLoadingIndicator(),
          );
        }
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
              EditGalleryBody(
                gallery: gallery,
              ),
            ],
          ),
        );
      },
    );
  }
}
