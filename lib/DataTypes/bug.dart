import 'package:bug_trucker/DataTypes/completion_status.dart';

class Bug {
  int? id;
  String? title;
  DateTime? postedDate;
  CompletionStatus? status;
  String? reporter;
  String? image;
  String? description;

  Bug(
      this.id,
      this.title,
      this.postedDate,
      this.status,
      this.reporter,
      this.image,
      this.description,
      );

  Bug.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        postedDate = DateTime.tryParse(json['postedDate'].toString()),
        status = json['status'],
        description = json['description'],
        image = json['image'],
        reporter = json['reporter'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'price': postedDate,
    'status': status,
    'description': description,
    'image': image,
    'reporter': reporter,
  };
}