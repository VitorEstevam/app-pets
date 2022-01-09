// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_news.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StoreNews on _StoreNews, Store {
  final _$newsAtom = Atom(name: '_StoreNews.news');

  @override
  ObservableList<News> get news {
    _$newsAtom.reportRead();
    return super.news;
  }

  @override
  set news(ObservableList<News> value) {
    _$newsAtom.reportWrite(value, super.news, () {
      super.news = value;
    });
  }

  @override
  String toString() {
    return '''
news: ${news}
    ''';
  }
}
