import 'dart:math';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mexico_explora/presentation/providers/carousel_provider.dart';
import 'package:mexico_explora/presentation/providers/search_provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class GalleryView extends ConsumerWidget {
  const GalleryView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController textEditingController = TextEditingController();
    final search = ref.watch(searchProvider);
    final imageCarousel = ref.watch(imageProvider(80, search, false));

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // SliverAppBar con título y buscador debajo
          SliverAppBar(
            pinned: true,
            floating: true,
            expandedHeight: 140,
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.only(top: kToolbarHeight + 10, left: 16, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Busca lugares increíbles',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextFormField(
                        onEditingComplete: () {
                          ref.read(searchProvider.notifier).changeSearch(textEditingController.text);
                        },
                        controller: textEditingController,
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hintText: search,
                          hintStyle: const TextStyle(color: Colors.black54),
                          prefixIcon: const Icon(Icons.search, color: Colors.black),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Espaciado opcional
          const SliverToBoxAdapter(child: SizedBox(height: 10)),

          // Galería de imágenes
          imageCarousel.when(
            data: (data) => SliverMasonryGrid.count(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childCount: data.length,
              itemBuilder: (context, index) {
                if (index == 1) {
                  return Column(
                    children: [
                      const SizedBox(height: 30),
                      MoviePosterLink(image: data[index].url),
                    ],
                  );
                }
                return MoviePosterLink(image: data[index].url);
              },
            ),
            loading: () => SliverSkeletonizer(
              child: SliverMasonryGrid.count(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                itemBuilder: (context, index) {
                                  if (index == 1) {
                  return Column(
                    children: [
                      const SizedBox(height: 30),
                      MoviePosterLink(image: 'https://i.etsystatic.com/16237790/r/il/591da5/5840470695/il_570xN.5840470695_gwx4.jpg'),
                    ],
                  );
                }
                return MoviePosterLink(image: 'https://i.etsystatic.com/16237790/r/il/591da5/5840470695/il_570xN.5840470695_gwx4.jpg');
                },
              )
            ),
            error: (error, _) => const SliverToBoxAdapter(
              child: Center(child: Text('Error al cargar imágenes')),
            ),
          ),
        ],
      ),
    );
  }
}

class MoviePosterLink extends StatelessWidget {
  final String image;

  const MoviePosterLink({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final random = Random();

    return FadeInUp(
      from: random.nextInt(100) + 80,
      delay: Duration(milliseconds: random.nextInt(450)),
      child: GestureDetector(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: FadeInImage(
            height: 200,
            fit: BoxFit.cover,
            placeholder: const AssetImage('assets/loaders/bottle-loader.gif'),
            image: NetworkImage(image),
          ),
        ),
      ),
    );
  }
}
