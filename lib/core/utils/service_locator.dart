import 'package:events_week_admin/core/utils/services/fireauth_service.dart';
import 'package:events_week_admin/core/utils/services/firestorage_service.dart';
import 'package:events_week_admin/core/utils/services/firestore_service.dart';
import 'package:events_week_admin/features/activities/data/repo/activities_repo_implementation.dart';
import 'package:events_week_admin/features/auth/data/repo/auth_repo_implementation.dart';
import 'package:events_week_admin/features/events/data/repo/events_repo_implementation.dart';
import 'package:events_week_admin/features/gallery/data/repo/gallery_repo_implementation.dart';
import 'package:events_week_admin/features/home/data/repo/home_repo_implementation.dart';
import 'package:events_week_admin/features/messages/data/repo/messages_repo_implementation.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<FirestoreService>(
    FirestoreService(),
  );
  getIt.registerSingleton<FirestorageService>(
    FirestorageService(),
  );
  getIt.registerSingleton<FireauthService>(
    FireauthService(),
  );
  getIt.registerSingleton<AuthRepoImplementation>(
    AuthRepoImplementation(
      getIt.get<FireauthService>(),
    ),
  );
  getIt.registerSingleton<EventsRepoImplementation>(
    EventsRepoImplementation(
      getIt.get<FirestoreService>(),
      getIt.get<FirestorageService>(),
    ),
  );
  getIt.registerSingleton<ActivitiesRepoImplementation>(
    ActivitiesRepoImplementation(
      getIt.get<FirestoreService>(),
      getIt.get<FirestorageService>(),
    ),
  );
  getIt.registerSingleton<GalleryRepoImplementation>(
    GalleryRepoImplementation(
      getIt.get<FirestorageService>(),
      getIt.get<FirestoreService>(),
    ),
  );
  getIt.registerSingleton<HomeRepoImplementation>(
    HomeRepoImplementation(
      getIt.get<FirestoreService>(),
    ),
  );
  getIt.registerSingleton<MessagesRepoImplementation>(
    MessagesRepoImplementation(
      getIt.get<FirestoreService>(),
    ),
  );
}
