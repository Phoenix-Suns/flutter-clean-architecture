import 'dart:convert';

import 'package:http/src/client.dart';
import 'package:nghia_flutter_clean/core/entity/data_state.dart';
import 'package:nghia_flutter_clean/core/entity/remote_response.dart';
import 'package:nghia_flutter_clean/core/helper/network_helper.dart';

import 'package:nghia_flutter_clean/features/data/models/repo.dart';
import 'package:nghia_flutter_clean/features/data/models/response/RepoListResponse.dart';

abstract class RepoRemoteDataSource {
  Future<RemoteResponse<RepoListResponse?>> fetchRepoList(
      Client client, String token);
}

class RepoRemoteDataSourceImpl implements RepoRemoteDataSource {
  @override
  Future<RemoteResponse<RepoListResponse?>> fetchRepoList(
      Client client, String token) async {

    var dynamicResponse = await httpGet(
        client, token, "https://api.github.com/search/repositories?q=a");

    return RemoteResponse<RepoListResponse>(
      data: RepoListResponse.fromJson(dynamicResponse.data),
      statusCode: dynamicResponse.statusCode
    );
  }
}
