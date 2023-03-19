import 'package:flutter/widgets.dart';
import 'package:nghia_flutter_clean/core/entity/usecase.dart';
import 'package:nghia_flutter_clean/features/data/models/repo.dart';
import 'package:nghia_flutter_clean/features/domain/usecases/fetch_repo_list_usecase.dart';
import 'package:nghia_flutter_clean/features/presentation/pages/repo_list/provider/repo_list2_state.dart';

class RepoListViewModel extends ChangeNotifier {
  FetchRepoListUseCase fetchRepoListUseCase;
  RepoList2LoadedState repoListLoadedState = const RepoList2LoadedState();

  RepoListViewModel(this.fetchRepoListUseCase);

  Future<void> fetchRepoList() async {

    repoListLoadedState = const RepoList2LoadedState(loading: true);
    notifyListeners();
    var dataStateRepos = await fetchRepoListUseCase.call(NoParams());
    repoListLoadedState = const RepoList2LoadedState(loading: false);
    notifyListeners();

    if (dataStateRepos.data != null) {
      // Success
      repoListLoadedState = RepoList2LoadedState(repos: dataStateRepos.data);
      notifyListeners();
    } else if (dataStateRepos.errorInfo?.errorType != null) {
      // Error
      repoListLoadedState = RepoList2LoadedState(errorMsg: dataStateRepos.errorInfo?.message);
      notifyListeners();
    }
  }

}

class RepoListLoadedNotifier with ChangeNotifier {
  List<Repo>? repos;
  bool? loading;
  String? errorMsg;

  void changeValue(bool? loading, List<Repo>?  repos, String? errorMsg) {
    this.repos = repos;
    this.loading = loading;
    this.errorMsg = errorMsg;
  }
}