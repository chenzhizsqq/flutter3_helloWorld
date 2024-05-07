// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Book _$BookFromJson(Map<String, dynamic> json) => Book(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      author: json['author'] == null
          ? null
          : Author.fromJson(json['author'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BookToJson(Book instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'author': instance.author,
    };

Author _$AuthorFromJson(Map<String, dynamic> json) => Author(
      id: json['id'],
      name: json['name'],
    );

Map<String, dynamic> _$AuthorToJson(Author instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
