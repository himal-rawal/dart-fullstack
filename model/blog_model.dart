class BlogPost {
  BlogPost({this.id, this.title, this.description, this.image});

  BlogPost.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String?;
    title = json['title'] as String;
    description = json['description'] as String;
    image = json['image'] as String?;
  }
  String? id;
  String? title;
  String? description;
  String? image;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['image'] = image;
    return data;
  }
}
