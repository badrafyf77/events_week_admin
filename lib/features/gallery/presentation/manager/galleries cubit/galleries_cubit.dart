import 'package:events_week_admin/features/gallery/data/model/gallery_model.dart';
import 'package:events_week_admin/features/gallery/data/repo/gallery_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'galleries_state.dart';

class GalleriesCubit extends Cubit<GalleriesState> {
  final GalleryRepo _galleryRepo;
  GalleriesCubit(this._galleryRepo) : super(GalleriesInitial());

  Future<void> addGallery(String title,DateTime date, XFile? image) async {
    emit(GalleriesLoading());
    var result = await _galleryRepo.addGallery(title, date, image);
    result.fold((left) {
      emit(GalleriesFailure(err: left.errMessage));
    }, (right) {
      emit(GalleriesSuccess(msg: "Galerie ajouté avec succès"));
    });
  }

  Future<void> getGalleries() async {
    emit(GalleriesLoading());
    var result = await _galleryRepo.getGalleries();
    result.fold((left) {
      emit(GalleriesFailure(err: left.errMessage));
    }, (right) {
      emit(GetGalleriesSuccess(galleriesList: right));
    });
  }

  Future<void> editGallery(
      Gallery gallery, String oldTitle, bool oldImage, XFile? image) async {
    emit(GalleriesLoading());
    var result = await _galleryRepo.updateGallery(
        gallery, oldTitle, oldImage, image);
    result.fold((left) {
      emit(GalleriesFailure(err: left.errMessage));
    }, (right) {
      emit(GalleriesSuccess(msg: "Galerie édité avec succès"));
    });
  }

  Future<void> deleteGallery(Gallery gallery) async {
    emit(GalleriesLoading());
    var result = await _galleryRepo.deleteGallery(gallery);
    result.fold((left) {
      emit(GalleriesFailure(err: left.errMessage));
    }, (right) {
      emit(GalleriesSuccess(msg: "Galerie supprimé avec succès"));
      getGalleries();
    });
  }
}
