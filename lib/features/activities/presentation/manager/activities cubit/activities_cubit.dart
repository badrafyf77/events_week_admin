import 'package:events_week_admin/features/activities/data/model/activity_model.dart';
import 'package:events_week_admin/features/activities/data/repo/activities_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'activities_state.dart';

class ActivitiesCubit extends Cubit<ActivitiesState> {
  final ActivitiesRepo _activitiesRepo;
  ActivitiesCubit(this._activitiesRepo) : super(ActivitiesInitial());

  Future<void> addActivity(
      String title, String description, XFile? image) async {
    emit(ActivitiesLaoding());
    var result = await _activitiesRepo.addActivity(title, description, image);
    result.fold((left) {
      emit(ActivitiesFailure(err: left.errMessage));
    }, (right) {
      emit(ActivitiesSuccess(msg: "Activité ajouté avec succès"));
    });
  }

  Future<void> getActivities() async {
    emit(ActivitiesLaoding());
    var result = await _activitiesRepo.getActivities();
    result.fold((left) {
      emit(ActivitiesFailure(err: left.errMessage));
    }, (right) {
      emit(GetActivitiesSuccess(activitiesList: right));
    });
  }

  Future<void> editActivity(
      Activity activity, String oldTitle, bool oldImage, XFile? image) async {
    emit(ActivitiesLaoding());
    var result = await _activitiesRepo.updateActivity(
        activity, oldTitle, oldImage, image);
    result.fold((left) {
      emit(ActivitiesFailure(err: left.errMessage));
    }, (right) {
      emit(ActivitiesSuccess(msg: "Activité édité avec succès"));
    });
  }

  Future<void> deleteActivity(Activity activity) async {
    emit(ActivitiesLaoding());
    var result = await _activitiesRepo.deleteActivity(activity);
    result.fold((left) {
      emit(ActivitiesFailure(err: left.errMessage));
    }, (right) {
      emit(ActivitiesSuccess(msg: "Activité supprimé avec succès"));
      getActivities();
    });
  }
}
