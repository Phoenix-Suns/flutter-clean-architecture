import 'package:nghia_flutter_clean/core/entity/data_state.dart';
import 'package:nghia_flutter_clean/core/entity/remote_response.dart';

Future<DataState<Result?>> repositoryExecutor<Response extends RemoteResponse, Result>(
    Future<bool> isNetworkConnected,
    Future<Response> Function() apiCall,
    Result Function(Response)? mapResult,
    Future<Result> Function()? cacheCall) async {

  if (await isNetworkConnected) {
    // === GET FROM SERVER ===
    try {
      var response = await apiCall.call();
      // Convert Response to Result
      if (response.statusCode == 200) {
        var repoList = mapResult?.call(response);
        return DataState.success(repoList, response.statusCode);
      }
      return DataState.apiError("", response.statusCode);
    } catch (e) {
      return DataState.apiError(e.toString(), 0);
    }
  } else {
    // === GET FROM CACHE ===
    if (cacheCall != null) {
      try {
        final repoList = await cacheCall.call();
        return DataState.success(repoList, 0);
      } catch (e) {
        return DataState.cacheError(e.toString());
      }
    }
  }
  return DataState.unexpectedError("");
}