// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Notes {
  String title;
  String body;
  int? id;
  Notes({
    required this.title,
    required this.body,
    this.id,
  });

  Notes copyWith({
    String? title,
    String? body,
    int? id,
  }) {
    return Notes(
      title: title ?? this.title,
      body: body ?? this.body,
      id: id ?? this.id,
    );
  }

  Map<String, Object?> toMap() {
    return <String, Object?>{
      'title': title,
      'body': body,
    };
  }

  factory Notes.fromMap(Map<String, Object?> map) {
    return Notes(
      title: map['title'] as String,
      body: map['body'] as String,
      id: map['_id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Notes.fromJson(String source) =>
      Notes.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Notes(title: $title, body: $body, id: $id)';

  @override
  bool operator ==(covariant Notes other) {
    if (identical(this, other)) return true;

    return other.title == title && other.body == body && other.id == id;
  }

  @override
  int get hashCode => title.hashCode ^ body.hashCode ^ id.hashCode;
}
