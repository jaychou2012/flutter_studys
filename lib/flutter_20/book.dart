import 'package:json_annotation/json_annotation.dart';

// book.g.dart 将在我们运行生成命令后自动生成
part 'book.g.dart';

///这个标注是告诉生成器，这个类是需要生成Model类的
@JsonSerializable(nullable: false)

class Book{
  Book(this.name, this.author);

  String name;
  String author;
  //不同的类使用不同的mixin即可
  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
  Map<String, dynamic> toJson() => _$BookToJson(this);
}