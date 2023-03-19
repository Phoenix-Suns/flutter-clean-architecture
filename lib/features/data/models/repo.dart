
// https://www.bezkoder.com/dart-flutter-parse-json-string-array-to-object-list/
// https://www.bezkoder.com/dart-flutter-convert-object-to-json-string/
// https://app.quicktype.io/
class Repo {
  final String title;
  final String poster;

  Repo({
    required this.title,
    required this.poster,
  });

  factory Repo.fromJson(Map<String, dynamic> json) => Repo(
    title: json["title"],
    poster: json["poster"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "poster": poster,
  };
}
