
class RemoteResponse<T> {
  T data;
  int statusCode;

  RemoteResponse({required this.data, required this.statusCode});
}
