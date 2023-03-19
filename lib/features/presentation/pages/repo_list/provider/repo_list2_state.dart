import 'package:equatable/equatable.dart';
import 'package:nghia_flutter_clean/features/data/models/repo.dart';

abstract class RepoList2State {
  const RepoList2State();
}

class RepoList2Initial extends RepoList2State { }

class RepoList2LoadedState extends RepoList2State {
  final List<Repo>? repos;
  final bool? loading;
  final String? errorMsg;
  const RepoList2LoadedState({this.loading, this.repos, this.errorMsg});
}
