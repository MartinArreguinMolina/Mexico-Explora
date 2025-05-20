import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mexico_explora/presentation/providers/view_provider.dart';
import 'package:mexico_explora/presentation/shared/bottom_navigator_bar.dart';
import '../../views/views.dart';


List<Widget> views = [
  AboutView(),
  HomeView(),
  GalleryView(),
];

class HomeScreen extends ConsumerWidget {

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final indexView = ref.watch(viewProvider);

    return Scaffold(
      body: views[indexView],
      bottomNavigationBar: BottomNavigatorBar(),
    );
  }
}