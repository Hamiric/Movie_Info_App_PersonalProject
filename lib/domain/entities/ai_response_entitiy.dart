class AiResponseEntitiy {
  List<AiPickMovie> recommendMovies;

  AiResponseEntitiy({required this.recommendMovies});

  AiResponseEntitiy.fromJson(Map<String, dynamic> json) : this(
    recommendMovies: List<AiPickMovie>.from(json['recommend_movie'].map((item)=>AiPickMovie.fromJson(item))),
  );
}

class AiPickMovie{
  String title;
  String reason;

  AiPickMovie({required this.title, required this.reason});

  AiPickMovie.fromJson(Map<String,dynamic> json) : this(
    title: json['title'],
    reason: json['reason'],
  );
}