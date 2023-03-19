import 'dart:convert';

import 'package:nghia_flutter_clean/core/entity/remote_response.dart';

import 'package:nghia_flutter_clean/features/data/models/repo.dart';
import 'package:nghia_flutter_clean/features/data/models/response/RepoListResponse.dart';
import 'package:shared_preferences/shared_preferences.dart';


const cachedRepoListKey = 'cached_repo_list';

abstract class RepoLocalDataSource {
  Future<void> cacheRepoList(List<Repo> repoList);

  Future<List<Repo>> getRepoList();
}

class RepoLocalDataSourceImpl implements RepoLocalDataSource {
  final SharedPreferences sharedPreferences;

  RepoLocalDataSourceImpl(this.sharedPreferences);

  @override
  Future<void> cacheRepoList(List<Repo> repoList) {
    return sharedPreferences.setString(
      cachedRepoListKey,
      json.encode(repoList),
    );
  }

  @override
  Future<List<Repo>> getRepoList() {
    final jsonString = sharedPreferences.getString(cachedRepoListKey);
    if (jsonString != null) {
      var dynamicList = json.decode(jsonString) as List;
      var repoList = (dynamicList.map((e) => Repo.fromJson(e))).toList();
      return Future.value(repoList);
    } else {
      return Future.value();
    }
  }

}
