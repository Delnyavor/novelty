import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import '../features/auth/data/repositories/authentication_repository.dart';

final sl = GetIt.instance;
Future<void> initDependencies() async {
  initAuthFeature();
}

void initAuthFeature() {
  // sl.registerLazySingleton(() => CreateUser(sl()));
  // sl.registerLazySingleton(() => DeleteUser(sl()));
  // sl.registerLazySingleton(() => GetUser(sl()));
  // sl.registerLazySingleton(() => UpdateUser(sl()));
  // sl.registerLazySingleton(() => SignIn(sl()));
  // sl.registerLazySingleton(() => Verify(sl()));

  sl.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepository(
            firebaseAuth: sl(),
          ));

  sl.registerLazySingleton<FirebaseAuth>(
    () => FirebaseAuth.instance,
  );
}
