class Comment {
  int? id;
  int? bugId;
  DateTime? postedDate;
  String? poster;
  String? posterImage;
  String? description;

  Comment(
      this.id,
      this.bugId,
      this.postedDate,
      this.poster,
      this.posterImage,
      this.description,
      );

  Comment.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        bugId = json['bugId'],
        postedDate = DateTime.tryParse(json['postedDate'].toString()),
        poster = json['poster'],
        description = json['description'],
        posterImage = json['posterImage'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'bugId': bugId,
    'price': postedDate,
    'poster': poster,
    'description': description,
    'posterImage': posterImage,
  };
}