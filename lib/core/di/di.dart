// dependency_injection.dart
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/data/data_sources/auth_remote_data_store.dart';
import '../../features/auth/data/repo_impl/auth_repo_impl.dart';
import '../../features/auth/domain/repo/auth_repo.dart';
import '../../features/auth/domain/usecase/login_usecase.dart';
import '../../features/auth/presentation/viewmodels/login_cubit.dart';
import '../network/dio_factory.dart';



final sl = GetIt.instance;

Future<void> initDependencies() async {
  // Dio
  sl.registerLazySingleton<Dio>(() => DioFactory.getDio());

  // Data sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
          () => AuthRemoteDataSourceImpl(sl()));

  // Repository
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));

  // UseCases
  sl.registerLazySingleton(() => LoginUseCase(sl()));

  // Cubits
  sl.registerFactory(() => LoginCubit(sl()));
}
