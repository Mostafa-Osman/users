import 'package:get_it/get_it.dart';
import 'package:users/features/users/data/services/users_services.dart';

import 'core/api/api_helper.dart';
import 'features/app_theme/controller/ThemeCubit.dart';
import 'features/network_checker/controller/network_checker.cubit.dart';
import 'features/users/presentation/controller/user_details_cubit/user_details_cubit.dart';
import 'features/users/presentation/controller/user_cubit/users_cubit.dart';

final sl = GetIt.instance;

void initServiceLocator() {
  // Services
  sl.registerLazySingleton<ApiService>(() => ApiService());

  // Repositories
  sl.registerLazySingleton<UsersServices>(
      () => UsersServices(sl<ApiService>()));

  // Cubits
  sl.registerFactory<UserCubit>(() => UserCubit(sl<UsersServices>()));
  sl.registerFactory<UserDetailsCubit>(
      () => UserDetailsCubit(sl<UsersServices>()));
  sl.registerFactory<NetworkCubit>(
    () => NetworkCubit(),
  );
  sl.registerFactory<ThemeCubit>(
    () => ThemeCubit(),
  );
}
