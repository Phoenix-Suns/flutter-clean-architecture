import 'package:nghia_flutter_clean/core/entity/data_state.dart';
import 'package:nghia_flutter_clean/features/data/models/repo.dart';

abstract class RepoRepository {
  Future<DataState<List<Repo>?>> fetchRepoList();
}
