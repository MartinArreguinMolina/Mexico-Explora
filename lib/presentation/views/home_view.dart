import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mexico_explora/presentation/providers/carousel_provider.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:mexico_explora/infraestructure/entities/image_entity.dart';

import '../widgets/widgets.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageCarousel = ref.watch(imageProvider(6, 'Mexico', true));
    final image1 = ref.watch(imageProvider(1, 'day of the dead', false));
    final image2 = ref.watch(imageProvider(1, 'archaeological mexico', false));
    final image3 = ref.watch(imageProvider(1, 'tulum', false));
    final image4 = ref.watch(imageProvider(1, 'mexican ecosystem', false));
    final image5 = ref.watch(imageProvider(1, 'Mexican Food', false));
    final image6 = ref.watch(imageProvider(1, 'pareja', false));
    final image7 = ref.watch(imageProvider(1, 'mexican fauna', false));
    

    return CustomScrollView(
      slivers: [
        const SliverAppBar(),

        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: 1,
            (context, index) {
              return Column(
                spacing: 20,
                children: [
                  
                  imageCarousel.when(
                    data: (data) => Carousel(movies: data),
                    error: (error, stakTree) => Text('Error: $error'),
                    loading: () => Skeletonizer(
                      enabled: true,
                      child: Carousel(
                        movies: List.generate(5,(_) => ImageEntity(url: 'https://i.etsystatic.com/16237790/r/il/591da5/5840470695/il_570xN.5840470695_gwx4.jpg', description: ''), // url vacío para simular carga
                        ),
                      ),
                    ),
                  ),


                  TextCard(
                    title: 'Hola Bienvenido a Mexico Explora',
                    description: 'Te ofrecemos información detallada sobre los destinos más impresionantes de México, actividades emocionantes para todos los gustos y consejos útiles para planificar tu viaje. Ya sea que estés buscando relajarte en una playa paradisíaca, explorar antiguas ruinas arqueológicas o deleitarte con la deliciosa gastronomía mexicana, aquí encontrarás todo lo que necesitas para hacer de tu viaje una experiencia inolvidable!',
                  ),


                  Text('¿Por que deberias de visitar Mexico?', style: TextStyle(fontSize: 23, color: Colors.amber),),
                  Divider(indent: 70, endIndent: 70,),

                  DescriptionImageCard(
                    imageListTile: image1,
                    title: '1. Cultura vibrante',
                    description: 'La riqueza cultural de México se refleja en sus festivales, arte, música y gastronomía.',
                    imageFirst: true,
                  ),

                  DescriptionImageCard(
                    imageListTile: image2,
                    title: '2. Sitios arqueológicos',
                    description: 'México es hogar de antiguas civilizaciones como los mayas, aztecas y zapotecas, lo que se refleja en sus impresionantes sitios arqueológicos.',
                    imageFirst: false,
                  ),

                  DescriptionImageCard(
                    imageListTile: image3,
                    title: '3. Playas espectaculares',
                    description: 'Con más de 9,000 kilómetros de costa, México cuenta con algunas de las playas más hermosas del mundo.',
                    imageFirst: true,
                  ),
                  
                  DescriptionImageCard(
                    imageListTile: image4,
                    title: '4. Biodiversidad impresionante',
                    description: 'México es uno de los países más megadiversos del mundo, con una amplia variedad de ecosistemas.',
                    imageFirst: false,
                  ),

                  DescriptionImageCard(
                    imageListTile: image5,
                    title: '5. Turismo gastronómico',
                    description: 'La gastronomía mexicana es reconocida a nivel mundial por su diversidad y sabor. Desde los tacos y tamales hasta los moles y ceviches.',
                    imageFirst: true,
                  ),

                  DescriptionImageCard(
                    imageListTile: image6,
                    title: '6. Ciudades del romance',
                    description: 'Descubre la magia del romance en las encantadoras ciudades de México, estos destinos ofrecen un escenario perfecto para momentos inolvidables en pareja.',
                    imageFirst: false,
                  ),

                  DescriptionImageCard(
                    imageListTile: image7,
                    title: '6. Fauna',
                    description: 'La fauna de México es una de las más diversas del mundo. Gracias a su variedad de climas, ecosistemas y regiones geográficas.',
                    imageFirst: true,
                  ),


                  SizedBox(height: 50,)
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}


