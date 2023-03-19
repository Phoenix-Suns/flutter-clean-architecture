extension ListExt<T> on List<T> {

  List<List<T>> split(int at) =>
      <List<T>>[sublist(0, at), sublist(at)];

  List<R> mapToList<R>(R Function(T) convert) => map(convert).toList();
}