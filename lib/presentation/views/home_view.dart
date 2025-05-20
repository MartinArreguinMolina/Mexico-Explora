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
    final imageCardDescription1 = ref.watch(imageProvider(1, 'day of the dead', false));
    final imageCardDescription2 = ref.watch(imageProvider(1, 'archaeological mexico', false));
    final imageCardDescription3 = ref.watch(imageProvider(1, 'tulum', false));
    final imageCardDescription4 = ref.watch(imageProvider(1, 'mexican ecosystem', false));
    final imageCardDescription5 = ref.watch(imageProvider(1, 'Mexican Food', false));
    final imageCardDescription6 = ref.watch(imageProvider(1, 'pareja', false));
    final imageCardDescription7 = ref.watch(imageProvider(1, 'mexican fauna', false));


    final imageBeach = ref.watch(imageProvider(1, 'cancun', false));
    final imageForest = ref.watch(imageProvider(1, 'forest', false));
    final imageSanMiguel = ref.watch(imageProvider(1, 'cholula', false));
    final imageChichenItza = ref.watch(imageProvider(1, 'chichen itza', false));
    final imageBasicala = ref.watch(imageProvider(1, 'basilica de guadalupe', false));

    return CustomScrollView(
      slivers: [
      
        SliverAppBar(
        ),

        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: 1,
            (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [


                  imageCarousel.when(
                    data: (data) => Carousel(movies: data),
                    error: (error, stackTrace) => Text('Error: $error'),
                    loading: () => Skeletonizer(
                      enabled: true,
                      child: Carousel(
                        movies: List.generate(6, (_) => ImageEntity(
                            url: 'https://i.etsystatic.com/16237790/r/il/591da5/5840470695/il_570xN.5840470695_gwx4.jpg',
                            description: '',
                          ),
                        ),
                      ),
                    ),
                  ),

                  TextCard(
                    description: 'Te ofrecemos información detallada sobre los destinos más impresionantes de México, actividades emocionantes para todos los gustos y consejos útiles para planificar tu viaje. Ya sea que estés buscando relajarte en una playa paradisíaca, explorar antiguas ruinas arqueológicas o deleitarte con la deliciosa gastronomía mexicana, aquí encontrarás todo lo que necesitas para hacer de tu viaje una experiencia inolvidable.\n\n¡Prepárate para descubrir la magia de México con nosotros! Bienvenido a un mundo de aventura, diversidad y hospitalidad mexicana. ¡Comienza tu viaje ahora mismo!', 
                    title: 'Bievenido a Mexico Explora'
                  ),
                  // NUEVA SECCIÓN DESTINOS RECOMENDADOS (ICONOS)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8,
                  ),
                  child: Text(
                    'Destinos recomendados',
                    style: TextStyle(fontSize: 23, color: Colors.amber),
                  ),
                ),

                SizedBox(
                  height: 150,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    children: [
                      imageBeach.when(
                        data:(data) => DestinationIconCard(icon: Icons.beach_access,title: 'Cancun',imageUrl: data[0].url,),
                        error: (e, r) => Text(''),
                        loading: () => Skeletonizer(
                          child: DestinationIconCard(icon: Icons.abc, title: '', imageUrl: 'https://i.etsystatic.com/16237790/r/il/591da5/5840470695/il_570xN.5840470695_gwx4.jpg'),
                        ),
                      ),
                      imageSanMiguel.when(
                        data:(data) => DestinationIconCard(icon: Icons.park,title: 'Cholula',imageUrl: data[0].url,),
                        error: (e, r) => Text(''),
                        loading: () => Skeletonizer(
                          child: DestinationIconCard(icon: Icons.abc, title: '', imageUrl: 'https://i.etsystatic.com/16237790/r/il/591da5/5840470695/il_570xN.5840470695_gwx4.jpg'),
                        ),
                      ),
                      imageChichenItza.when(
                        data:(data) => DestinationIconCard(icon: Icons.landscape,title: 'Chichen itza',imageUrl: data[0].url,),
                        error: (e, r) => Text(''),
                        loading: () => Skeletonizer(
                          child: DestinationIconCard(icon: Icons.abc, title: '', imageUrl: 'https://i.etsystatic.com/16237790/r/il/591da5/5840470695/il_570xN.5840470695_gwx4.jpg'),
                        ),
                      ),
                      imageForest.when(
                        error: (e, r) => Text(''),
                        data:(data) => DestinationIconCard(icon: Icons.cabin,title: 'Laguna larga',imageUrl: data[0].url,),
                        loading: () => Skeletonizer(
                          child: DestinationIconCard(icon: Icons.abc, title: '', imageUrl: 'https://i.etsystatic.com/16237790/r/il/591da5/5840470695/il_570xN.5840470695_gwx4.jpg'),
                        ),
                      ),
                      imageBasicala.when(
                        data:(data) => DestinationIconCard(icon: Icons.church,title: 'Basilica de guadalupe',imageUrl: data[0].url,),
                        error: (e, r) => Text(''),
                        loading: () => Skeletonizer(
                          child: DestinationIconCard(icon: Icons.abc, title: '', imageUrl: 'https://i.etsystatic.com/16237790/r/il/591da5/5840470695/il_570xN.5840470695_gwx4.jpg'),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 25,),

                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                    child: Text('¿Por qué deberías de visitar México?',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 23, color: Colors.amber)),
                  ),

                  DescriptionImageCard(
                    imageListTile: imageCardDescription1,
                    title: '1. Cultura vibrante',
                    description:
                        'La riqueza cultural de México se refleja en sus festivales, arte, música y gastronomía.',
                    imageFirst: true,
                  ),

                  DescriptionImageCard(
                    imageListTile: imageCardDescription2,
                    title: '2. Sitios arqueológicos',
                    description:
                        'México es hogar de antiguas civilizaciones como los mayas, aztecas y zapotecas, lo que se refleja en sus impresionantes sitios arqueológicos.',
                    imageFirst: false,
                  ),

                  DescriptionImageCard(
                    imageListTile: imageCardDescription3,
                    title: '3. Playas espectaculares',
                    description:
                        'Con más de 9,000 kilómetros de costa, México cuenta con algunas de las playas más hermosas del mundo.',
                    imageFirst: true,
                  ),

                  DescriptionImageCard(
                    imageListTile: imageCardDescription4,
                    title: '4. Biodiversidad impresionante',
                    description:
                        'México es uno de los países más megadiversos del mundo, con una amplia variedad de ecosistemas.',
                    imageFirst: false,
                  ),

                  DescriptionImageCard(
                    imageListTile: imageCardDescription5,
                    title: '5. Turismo gastronómico',
                    description:
                        'La gastronomía mexicana es reconocida a nivel mundial por su diversidad y sabor. Desde los tacos y tamales hasta los moles y ceviches.',
                    imageFirst: true,
                  ),

                  DescriptionImageCard(
                    imageListTile: imageCardDescription6,
                    title: '6. Ciudades del romance',
                    description:
                        'Descubre la magia del romance en las encantadoras ciudades de México, estos destinos ofrecen un escenario perfecto para momentos inolvidables en pareja.',
                    imageFirst: false,
                  ),

                  DescriptionImageCard(
                    imageListTile: imageCardDescription7,
                    title: '7. Fauna',
                    description:
                        'La fauna de México es una de las más diversas del mundo. Gracias a su variedad de climas, ecosistemas y regiones geográficas.',
                    imageFirst: true,
                  ),


                  const SizedBox(height: 50),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}