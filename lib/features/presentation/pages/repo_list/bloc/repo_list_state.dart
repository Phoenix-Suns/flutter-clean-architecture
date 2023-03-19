import 'package:equatable/equatable.dart';
import 'package:nghia_flutter_clean/features/data/models/repo.dart';

abstract class RepoListState extends Equatable {
  const RepoListState();

  @override
  List<Object> get props => [];
}

class RepoListInitial extends RepoListState { }

class RepoListLoadedState extends RepoListState {
  final List<Repo>? repos;
  final bool? loading;
  final String? errorMsg;
  const RepoListLoadedState({ this.loading, this.repos, this.errorMsg});

  @override
  List<Object> get props {
    if (repos != null) {
      return [repos!];
    }
    return [];
  }
}
