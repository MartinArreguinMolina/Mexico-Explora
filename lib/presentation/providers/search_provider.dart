

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_provider.g.dart';

@Riverpod(keepAlive: true)
class Search extends _$Search {
  @override
  String build() {
    return 'Mexico';
  }

  void changeSearch(String query){
    state = query;
  }
}