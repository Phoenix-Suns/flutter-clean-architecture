import 'package:http/http.dart' as http;

import 'package:nghia_flutter_clean/core/entity/data_state.dart';
import 'package:nghia_flutter_clean/core/entity/remote_response.dart';
import 'package:nghia_flutter_clean/core/helper/general_helpers.dart';
import 'package:nghia_flutter_clean/core/helper/network_info.dart';
import 'package:nghia_flutter_clean/features/data/datasources/repo_local_datasource.dart';
import 'package:nghia_flutter_clean/features/data/datasources/repo_remote_datasource.dart';
import 'package:nghia_flutter_clean/features/data/models/repo.dart';
import 'package:nghia_flutter_clean/features/data/models/response/RepoListResponse.dart';
import 'package:nghia_flutter_clean/features/domain/repositories/repo_repository.dart';

class RepoRepositoryImpl implements RepoRepository {
  http.Client client;
  RepoRemoteDataSource remoteDataSource;
  NetworkInfo networkInfo;
  RepoLocalDataSource localDataSource;

  RepoRepositoryImpl(this.client, this.remoteDataSource, this.networkInfo,
      this.localDataSource);

  @override
  Future<DataState<List<Repo>?>> fetchRepoList() async {
    /*if (await networkInfo.isConnected) {

      // === GET FROM SERVER ===
      try {
        var response = await remoteDataSource.fetchRepoList(client, 'token');
        // Convert response data to
        if (response.statusCode == 200) {
          var repoList = response.data?.items
              ?.map((e) =>
                  Repo(title: e.name ?? '', poster: e.owner?.avatarUrl ?? ''))
              .toList();

          localDataSource.cacheRepoList(repoList ?? <Repo>[]);
          return DataState.success(repoList, response.statusCode);
        }
        return DataState.apiError("", response.statusCode);
      } catch (e) {
        return DataState.apiError(e.toString(), 0);
      }
    } else {
      // === GET FROM CACHE ===
      try {
        final repoList = await localDataSource.getRepoList();
        return DataState.success(repoList, 0);
      } catch (e) {
        return DataState.cacheError(e.toString());
      }
    }
  }*/
    return repositoryExecutor<RemoteResponse<RepoListResponse?>, List<Repo>?>(
        networkInfo.isConnected,
            () {
          return remoteDataSource.fetchRepoList(client, 'token');
        },
            (response) {
          var repoList = response.data?.items
              ?.map((e) =>
              Repo(title: e.name ?? '', poster: e.owner?.avatarUrl ?? ''))
              .toList();

          localDataSource.cacheRepoList(repoList ?? <Repo>[]);
          return repoList;
        },
            () {
          return localDataSource.getRepoList();
        }
    );
  }
}
