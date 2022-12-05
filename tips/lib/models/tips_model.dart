
import 'dart:convert';


List<MyArticle> ArticleFromJson(String str) => List<MyArticle>.from(json.decode(str).map((x) => MyArticle.fromJson(x)));

String ArticleToJson(List<MyArticle> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class MyArticle {
  MyArticle({
    required this.pk,
    required this.fields,
  });

  int pk;
  Fields fields;

  // TODO: author pk nya belum


  factory MyArticle.fromJson(Map<String, dynamic> json) => MyArticle(
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
  Fields({
    required this.title,
    required this.content,
    required this.publish,
    required this.image,
    //TODO URL IMAGE
  });

  
  String title;
  double content;
  DateTime publish;
  String image;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        
        title: json["title"],
        content: json["content"],
        publish: DateTime.parse(json["publish"]),
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        
        "title": title,
        "content": content,
        "publish":
            "${publish.year.toString().padLeft(4, '0')}-${publish.month.toString().padLeft(2, '0')}-${publish.day.toString().padLeft(2, '0')}",
       "image": image

      };
}
