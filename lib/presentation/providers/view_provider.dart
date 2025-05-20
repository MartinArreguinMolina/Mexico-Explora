

import 'package:riverpod_annotation/riverpod_annotation.dart';


part 'view_provider.g.dart';

@Riverpod(keepAlive: true)
class View extends _$View {
  @override
  int build() {
    return 1;
  }


  void changeView({required int newView}){
    state = newView;
  }
}