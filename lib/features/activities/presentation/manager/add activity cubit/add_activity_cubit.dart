import 'package:events_week_admin/features/activities/data/repo/activities_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'add_activity_state.dart';

class AddActivityCubit extends Cubit<AddActivityState> {
  final ActivitiesRepo _activitiesRepo;
  AddActivityCubit(this._activitiesRepo) : super(AddActivityInitial());

  Future<void> addActivity(
      String title, String description, XFile? image) async {
    emit(AddActivityLaoding());
    var result = await _activitiesRepo.addActivity(title, description, image);
    result.fold((left) {
      emit(AddActivityFailure(err: left.errMessage));
    }, (right) {
      emit(AddActivitySuccess());
    });
  }
}
