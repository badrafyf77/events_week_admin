part of 'edit_event_bloc.dart';

abstract class EditEventEvent {}

class EditEvent extends EditEventEvent {
  final String id;
  final String title;
  final String description;
  final String place;
  final bool oldImage;
  final String downloadUrl;
  final XFile image;
  final DateTime date;

  EditEvent({required this.id, required this.title, required this.description, required this.place, required this.oldImage, required this.downloadUrl, required this.image, required this.date});
}
