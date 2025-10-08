// dependency_injection.dart
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/app/data/data_sources/category_remote_data_source.dart';
import '../../features/app/data/data_sources/category_remote_data_source_impl.dart';
import '../../features/app/data/repo_impl/category_repo_impl.dart';
import '../../features/app/domain/repo/categories_repo.dart';
import '../../features/app/domain/usecase/get_categories_usecase.dart';
import '../../features/app/presentation/viewmodels/category/categories_cubit.dart';
import '../../features/auth/data/data_sources/auth_remote_data_store.dart';
import '../../features/auth/data/repo_impl/auth_repo_impl.dart';
import '../../features/auth/domain/repo/auth_repo.dart';
import '../../features/auth/domain/usecase/login_usecase.dart';
import '../../features/auth/domain/usecase/regester_usecase.dart';
import '../../features/auth/presentation/viewmodels/login/login_cubit.dart';
import '../../features/auth/presentation/viewmodels/register/register_cubit.dart';
import '../network/dio_factory.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  // Dio
  sl.registerLazySingleton<Dio>(() => DioFactory.getDio());

  // Data sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<CategoriesRemoteDataSource>(
        () => CategoriesRemoteDataSourceImpl(sl()),
  );

  // Repository
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));
  sl.registerLazySingleton<CategoriesRepo>(() => CategoriesRepoImpl(sl()));

  // UseCases
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => RegisterUseCase(sl()));
  sl.registerLazySingleton<GetCategoriesUseCase>(
        () => GetCategoriesUseCase(sl()),
  );

  // Cubits
  sl.registerFactory(() => LoginCubit(sl()));
  sl.registerFactory(() => RegisterCubit(sl()));
  sl.registerFactory(() => CategoriesCubit(getCategoriesUseCase: sl()));


}
