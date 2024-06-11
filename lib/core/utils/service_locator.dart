import 'package:events_week_admin/core/services/firestorage_service.dart';
import 'package:events_week_admin/core/services/firestore_service.dart';
import 'package:events_week_admin/features/events/data/repo/events_repo_implementation.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<FirestoreService>(
    FirestoreService(),
  );
  getIt.registerSingleton<FireStorageService>(
    FireStorageService(),
  );
  getIt.registerSingleton<EventsRepoImplementation>(
    EventsRepoImplementation(
      getIt.get<FirestoreService>(),
      getIt.get<FireStorageService>(),
    ),
  );
}
