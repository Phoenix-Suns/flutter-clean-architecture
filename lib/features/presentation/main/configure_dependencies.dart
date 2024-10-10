import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:get_it/get_it.dart';
import 'package:nghia_flutter_clean/core/helper/network_info.dart';
import 'package:nghia_flutter_clean/features/data/datasources/repo_local_datasource.dart';
import 'package:nghia_flutter_clean/features/data/datasources/repo_remote_datasource.dart';
import 'package:nghia_flutter_clean/features/data/repositories/repo_repository_impl.dart';
import 'package:nghia_flutter_clean/features/domain/repositories/repo_repository.dart';
import 'package:nghia_flutter_clean/features/domain/usecases/fetch_repo_list_usecase.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  //todo Bloc
  configureUseCase();
  configureRepository();
  configureRemoteDatasource();
  configureLocalDatasource();
  configureOtherDependencies();
}

void configureUseCase() {
  getIt.registerLazySingleton(() => FetchRepoListUseCase(getIt()));
}

void configureRepository() {
  getIt
      .registerLazySingleton<RepoRepository>(() => RepoRepositoryImpl(getIt(), getIt(), getIt(), getIt()));
}

void configureRemoteDatasource() {
  getIt
      .registerLazySingleton<RepoRemoteDataSource>(() => RepoRemoteDataSourceImpl());
}

void configureLocalDatasource() {
  getIt
      .registerLazySingleton<RepoLocalDataSource>(() => RepoLocalDataSourceImpl(getIt()));
}

void configureOtherDependencies() async {
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));
  getIt.registerLazySingleton(() => http.Client());
  getIt.registerLazySingleton(() => DataConnectionChecker());
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);
}

/*class ConfigureDependenciesManual {
  // Other
  late final networkInfo = NetworkInfoImpl(getIt());
  late final httpClient = http.Client();
  late final dataConnectionChecker = DataConnectionChecker();
  late final SharedPreferences sharedPreferences;

  // Use Case
  late final fetchRepoListUseCase = FetchRepoListUseCase(getIt());

  // Repo
  late final repoRepository = RepoRepositoryImpl(getIt(), getIt(), getIt(), getIt());

  // Remote Data Source
  late final RepoRemoteDataSourceImpl repoRemoteDataSource;

  // Local Data Source
  late final RepoLocalDataSourceImpl repoLocalDataSource;

  Future init() async {
    // Other
    sharedPreferences = await SharedPreferences.getInstance();
    ...

    // Remote Data Source
    repoRemoteDataSource = RepoRemoteDataSourceImpl();

    // Local Data Source
    repoLocalDataSource = RepoLocalDataSourceImpl(sharedPreferences);

  }
}*/
