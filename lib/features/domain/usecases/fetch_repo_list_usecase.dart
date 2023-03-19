

import 'package:nghia_flutter_clean/core/entity/data_state.dart';
import 'package:nghia_flutter_clean/core/entity/usecase.dart';
import 'package:nghia_flutter_clean/features/data/models/repo.dart';
import 'package:nghia_flutter_clean/features/domain/repositories/repo_repository.dart';

class FetchRepoListUseCase implements UseCase<DataState<List<Repo>?>, NoParams> {
  final RepoRepository repository;

  FetchRepoListUseCase(this.repository);

  @override
  Future<DataState<List<Repo>?>> call(NoParams params) async {
    return await repository.fetchRepoList();
  }
}
