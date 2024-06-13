import 'package:events_week_admin/core/services/firestorage_service.dart';
import 'package:events_week_admin/core/services/firestore_service.dart';
import 'package:events_week_admin/features/events/data/repo/events_repo_implementation.dart';
import 'package:events_week_admin/features/home/data/home_repo_implementation.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<FirestoreService>(
    FirestoreService(),
  );
  getIt.registerSingleton<FirestorageService>(
    FirestorageService(),
  );
  getIt.registerSingleton<EventsRepoImplementation>(
    EventsRepoImplementation(
      getIt.get<FirestoreService>(),
      getIt.get<FirestorageService>(),
    ),
  );
  getIt.registerSingleton<HomeRepoImplementation>(
    HomeRepoImplementation(
      getIt.get<FirestoreService>(),
    ),
  );
}
