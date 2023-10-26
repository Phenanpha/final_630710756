/*
{
  userId: 1,
  id: 1,
  title: "delectus aut autem",
  completed: false
}
*/

class TodoItem {
  final double city;
  final double country;
  final double lastUpdated;
  final double tempC;
  final double tempF;
  final double feelsLikeC;
  final double feelsLikeF;
  final double windKph;
  final double windMph;
  final double humidity;
  final double uv;

  final String title;

  TodoItem({
    required this.city,
    required this.country,
    required this.lastUpdated,
    required this.tempC,
    required this.tempF,
    required this.feelsLikeC,
    required this.feelsLikeF,
    required this.windKph,
    required this.windMph,
    required this.humidity,
    required this.uv,
    required this.title,
  });

  factory TodoItem.fromJson(Map json) {
    return TodoItem(
      city: json['city'],
      country: json['country'],
      lastUpdated: json['lastUpdated'],
      tempC: json['tempC'],
      tempF: json['tempF'],
      feelsLikeC: json['feelsLikeC'],
      feelsLikeF: json['feelsLikeF'],
      windKph: json['windKph'],
      windMph: json['windMph'],
      humidity: json['humidity'],
      uv: json['uv'],
      title: json['title'],
    );
  }
}