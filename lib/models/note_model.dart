class NoteModel {
  String? title;
  String? createdTime;
  String? note;
  String? uid;

  NoteModel({
    this.createdTime,
    this.title,
    this.note,
    this.uid,
  });

  NoteModel fromJson(Map<String, dynamic> json, String id) => NoteModel(
        createdTime: json['createdTime'],
        title: json['title'],
        note: json['note'],
        uid: id,
      );
      
  Map<String, dynamic> toJson() => {
        'createdTime': createdTime,
        'title': title,
        'note': note,
      };
}
