import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:mexico_explora/infraestructure/entities/image_entity.dart';


class Carousel extends StatelessWidget {
  
  final List<ImageEntity> movies;
  
  const Carousel({
    super.key, 
    required this.movies
  });

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      height: 250,
      width: double.infinity,
      child: Swiper(
        viewportFraction: 0.8,
        scale: 0.9,
        autoplay: true,
        pagination: SwiperPagination(
          margin: const EdgeInsets.only(top: 0),
          builder: DotSwiperPaginationBuilder(
            activeColor: colors.primary,
            color: colors.secondary
          )
        ),
        itemCount: movies.length,
        itemBuilder: (context, index) => _Slide(image: movies[index] ),
      ),
    );
  }
}


class _Slide extends StatelessWidget {

  final ImageEntity image;

  const _Slide({required this.image});

  @override
  Widget build(BuildContext context) {

    final decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(20),
    );

      
    return Padding(
      padding: const EdgeInsets.only( bottom: 30 ),
      child: DecoratedBox(
        decoration: decoration,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: FadeInImage(
            fit: BoxFit.cover,
            placeholder: const AssetImage('assets/loaders/bottle-loader.gif'),
            image: NetworkImage(image.url),
          )
        )
      ),
    );
  }
}
