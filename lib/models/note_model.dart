class NoteModel {
  String? title;
  String? createdTime;
  String? note;
  String? id;

  NoteModel({
    this.createdTime,
    this.title,
    this.note = '',
    this.id,
  });

  static NoteModel fromJson(Map<String, dynamic> json) => NoteModel(
        createdTime: json['createdTime'],
        title: json['title'],
        note: json['note'],
        id: json['id'],
      );

  Map<String, dynamic> toJson() => {
        'createdTime': createdTime,
        'title': title,
        'note': note,
        'id': id,
      };
}
