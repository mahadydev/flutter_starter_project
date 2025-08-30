import 'package:dio/dio.dart';
import 'package:flutter_starter_project/app/language/language_cubit.dart';
import 'package:flutter_starter_project/app/theme/cubit/theme_cubit.dart';
import 'package:flutter_starter_project/core/network/connection_checker/internet_connection_cubit.dart';
import 'package:flutter_starter_project/core/network/dio_module.dart';
import 'package:flutter_starter_project/core/network/rest_api_client.dart';
import 'package:flutter_starter_project/core/storage/drift/app_database.dart';
import 'package:flutter_starter_project/core/storage/secure_storage.dart';
import 'package:flutter_starter_project/core/storage/simple_storage.dart';
import 'package:get_it/get_it.dart';

final GetIt serviceLocator = GetIt.instance;

/// Configures all dependencies for the application.
/// This function should be called at app startup.
Future<void> configureDependencies() async {
  await _registerStorageServices();
  await _registerNetworkServices();
  await _registerDatabase();
  await _registerThemeCubit();
  await _registerLanguageCubit();
  await _registerInternetConnectionCubit();

  // Ensure all services are ready before proceeding
  await serviceLocator.allReady();
}

/// Registers storage-related singletons (SecureStorageService, SimpleStorageService).
Future<void> _registerStorageServices() async {
  // SecureStorageService for secure key-value storage (e.g., tokens)
  serviceLocator
    ..registerLazySingleton<SecureStorageService>(SecureStorageServiceImpl.new)
    // SimpleStorageService for simple key-value storage (e.g., preferences)
    ..registerSingletonAsync<SimpleStorageService>(
      SimpleStorageServiceImpl.create,
    );
  await serviceLocator.isReady<SimpleStorageService>();
}

/// Registers network-related singletons (Dio, RestApiClient).
Future<void> _registerNetworkServices() async {
  final dioModule = DioModule();

  // Dio instance for network requests
  serviceLocator
    ..registerLazySingleton<Dio>(dioModule.provideDio)
    // RestApiClient using the Dio instance for API calls
    ..registerLazySingleton<RestApiClient>(
      () => RestApiClient(serviceLocator<Dio>()),
    );
}

/// Registers AppDatabase singleton for local database access using Drift.
Future<void> _registerDatabase() async {
  serviceLocator.registerSingletonAsync<AppDatabase>(
    AppDatabase.create,
    dispose: (db) => db.close(),
  );
  await serviceLocator.isReady<AppDatabase>();
}

/// Registers ThemeCubit singleton for managing app theme state.
Future<void> _registerThemeCubit() async {
  serviceLocator.registerSingletonAsync<ThemeCubit>(() async {
    final themeCubit = await ThemeCubit.create(
      serviceLocator<SimpleStorageService>(),
    );
    return themeCubit;
  });
  await serviceLocator.isReady<ThemeCubit>();
}

/// Registers LanguageCubit singleton for managing app language/localization state.
Future<void> _registerLanguageCubit() async {
  serviceLocator.registerSingletonAsync<LanguageCubit>(() async {
    final languageCubit = await LanguageCubit.create(
      serviceLocator<SimpleStorageService>(),
    );
    return languageCubit;
  });
  await serviceLocator.isReady<LanguageCubit>();
}

/// Registers InternetConnectionCubit singleton for network status.
Future<void> _registerInternetConnectionCubit() async {
  serviceLocator.registerLazySingleton<InternetConnectionCubit>(
    InternetConnectionCubit.new,
  );
}
