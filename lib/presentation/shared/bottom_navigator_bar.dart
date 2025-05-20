import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mexico_explora/presentation/providers/view_provider.dart';

List<TabItem> tabsMenu = [
  TabItem(icon: Icon(Icons.people, color: Colors.white,)),
  TabItem(icon: Icon(Icons.home, color: Colors.white,)),
  TabItem(icon: Icon(Icons.image, color: Colors.white,)),
];

class BottomNavigatorBar extends ConsumerWidget {


  const BottomNavigatorBar({super.key});

  @override
  Widget build(BuildContext context, ref) {

    final indexView = ref.watch(viewProvider);


    return ConvexAppBar(
      activeColor: Colors.blueGrey,
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      initialActiveIndex: indexView,
      items: tabsMenu,
      onTap: (index) {
        ref.read(viewProvider.notifier).changeView(newView: index);
      },
    );
  }
}


