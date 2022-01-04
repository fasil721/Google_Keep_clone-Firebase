class NoteModel {
  String? title;
  String? createdTime;
  String? note;

  NoteModel({
    this.createdTime,
    this.title,
    this.note = '',
  });

   NoteModel fromJson(Map<String, dynamic> json) => NoteModel(
        createdTime: json['createdTime'],
        title: json['title'],
        note: json['note'],
      );

  Map<String, dynamic> toJson() => {
        'createdTime': createdTime,
        'title': title,
        'note': note,
      };
}
