import 'package:dartz/dartz.dart';
import 'package:events_week_admin/core/utils/failures.dart';
import 'package:events_week_admin/features/gallery/data/model/gallery_model.dart';
import 'package:image_picker/image_picker.dart';

abstract class GalleryRepo {
  Future<Either<Failure, List<Gallery>>> getGalleries();
  Future<Either<Failure, Unit>> addGallery(String title, XFile? image);
  Future<Either<Failure, Unit>> updateGallery(Gallery gallery, String oldTitle, bool oldImage, XFile? image);
  Future<Either<Failure, Unit>> deleteGallery(Gallery gallery);
}