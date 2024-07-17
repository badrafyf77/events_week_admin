part of 'galleries_cubit.dart';

sealed class GalleriesState {}

final class GalleriesInitial extends GalleriesState {}

final class GalleriesLoading extends GalleriesState {}

final class GalleriesSuccess extends GalleriesState {
  final String msg;

  GalleriesSuccess({required this.msg});
}

final class GalleriesFailure extends GalleriesState {
  final String err;

  GalleriesFailure({required this.err});
}

final class GetGalleriesSuccess extends GalleriesState {
  final List<Gallery> galleriesList;

  GetGalleriesSuccess({required this.galleriesList});
}
