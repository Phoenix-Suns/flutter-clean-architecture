import 'package:bloc/bloc.dart';
import 'package:nghia_flutter_clean/core/entity/usecase.dart';
import 'package:nghia_flutter_clean/features/domain/usecases/fetch_repo_list_usecase.dart';
import 'package:nghia_flutter_clean/features/presentation/pages/repo_list/bloc/repo_list_event.dart';
import 'package:nghia_flutter_clean/features/presentation/pages/repo_list/bloc/repo_list_state.dart';

class RepoListBloc extends Bloc<RepoListEvent, RepoListState> {

  FetchRepoListUseCase fetchRepoListUseCase;

  RepoListBloc(this.fetchRepoListUseCase)
      : super(RepoListInitial()) {
    on<FetchRepoListEvent>((event, emit) async {
      /*List<Repo> repos = <Repo>[
        Repo(title: "title1", poster: "poster1"),
        Repo(title: "title2", poster: "poster2"),
        Repo(title: "title3", poster: "poster3")
      ];
      emit(RepoListLoadedState(repos: repos));*/

      emit(const RepoListLoadedState(loading: true));
      var dataStateRepos = await fetchRepoListUseCase.call(NoParams());
      emit(const RepoListLoadedState(loading: false));

      if (dataStateRepos.data != null) {
        // Success
        emit(RepoListLoadedState(repos: dataStateRepos.data!));
      } else if (dataStateRepos.errorInfo?.errorType != null) {
        // Error
        emit(RepoListLoadedState(errorMsg: dataStateRepos.errorInfo?.message));
      }
    });
  }
}
