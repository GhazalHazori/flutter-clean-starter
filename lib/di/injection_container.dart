import 'package:get_it/get_it.dart';

import '../core/localization/localization_cubit.dart';
import '../core/theme/theme_cubit.dart';
import '../features/sample_feature/data/datasources/sample_remote_data_source.dart';
import '../features/sample_feature/data/repositories/sample_repository_impl.dart';
import '../features/sample_feature/domain/repositories/sample_repository.dart';
import '../features/sample_feature/domain/usecases/get_samples_use_case.dart';
import '../features/sample_feature/presentation/cubit/sample_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Core
  sl.registerLazySingleton<ThemeCubit>(() => ThemeCubit());
  sl.registerLazySingleton<LocalizationCubit>(() => LocalizationCubit());

  // Feature: Sample
  sl.registerLazySingleton<SampleRemoteDataSource>(
    () => SampleRemoteDataSourceImpl(),
  );

  sl.registerLazySingleton<SampleRepository>(
    () => SampleRepositoryImpl(remoteDataSource: sl()),
  );

  sl.registerLazySingleton<GetSamplesUseCase>(
    () => GetSamplesUseCase(sl()),
  );

  sl.registerFactory<SampleCubit>(
    () => SampleCubit(getSamplesUseCase: sl()),
  );
}


