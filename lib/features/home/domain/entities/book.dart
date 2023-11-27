import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class Book extends Equatable {
  final String title;
  final String author;
  final String isbn;
  final dynamic cover;

  Book(
      {required this.title,
      required this.author,
      required this.isbn,
      required this.cover})
      : assert(cover.runtimeType == String || cover.runtimeType == Uint8List);

  @override
  List<Object?> get props => [title, author, isbn, cover];
}
