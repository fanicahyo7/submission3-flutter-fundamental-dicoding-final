class Resto {
  String id;
  String title;

  Resto({this.id, this.title});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
    };
  }

  Resto.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
  }
}
