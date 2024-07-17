import 'package:dartz/dartz.dart';
import 'package:events_week_admin/core/utils/failures.dart';
import 'package:events_week_admin/features/gallery/data/model/gallery_model.dart';
import 'package:events_week_admin/features/gallery/data/repo/gallery_repo.dart';
import 'package:image_picker/image_picker.dart';

class GalleryRepoImplementation implements GalleryRepo{
  @override
  Future<Either<Failure, Unit>> addGallery(String title, XFile? image) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> deleteGallery(Gallery gallery) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Gallery>>> getGalleries() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> updateGallery(Gallery gallery, String oldTitle, bool oldImage, XFile? image) {
    throw UnimplementedError();
  }
}