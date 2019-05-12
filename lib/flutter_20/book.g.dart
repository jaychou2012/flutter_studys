// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Book _$BookFromJson(Map<String, dynamic> json) {
  return Book(json['name'] as String, json['author'] as String);
}

Map<String, dynamic> _$BookToJson(Book instance) =>
    <String, dynamic>{'name': instance.name, 'author': instance.author};
