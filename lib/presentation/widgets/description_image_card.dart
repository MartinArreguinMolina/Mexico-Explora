import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mexico_explora/infraestructure/entities/image_entity.dart';
import 'package:mexico_explora/presentation/widgets/slide.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DescriptionImageCard extends StatelessWidget {
  final String title;
  final String description;
  final bool imageFirst;

  const DescriptionImageCard({
    super.key,
    required this.imageListTile,
    required this.description,
    required this.title,
    required this.imageFirst
  });

  final AsyncValue<List<ImageEntity>> imageListTile;

  @override
  Widget build(BuildContext context) {
    return imageFirst ? ImageRowFirst(imageListTile: imageListTile, title: title, description: description) : ImageRowLast(imageListTile: imageListTile, title: title, description: description);
  }
}

class ImageRowFirst extends StatelessWidget {
  const ImageRowFirst({
    super.key,
    required this.imageListTile,
    required this.title,
    required this.description,
  });

  final AsyncValue<List<ImageEntity>> imageListTile;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        imageListTile.when(
          data: (data) => Slide(image: data[0]),
          error: (e,r) => Text('$e'),
          loading: () => Skeletonizer(
            enabled: true,
            child: Slide(image: ImageEntity(description: '', url: 'https://i.etsystatic.com/16237790/r/il/591da5/5840470695/il_570xN.5840470695_gwx4.jpg')),
          )
        ),
    
       Expanded(
         child: Card(
          shadowColor: Colors.amber,
           child: SizedBox(
            height: 220,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title
                    , style: TextStyle(fontSize: 20, color: Colors.amber),
                  ),
                  
                  Text(
                    description,
                    maxLines: 10,
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.justify,
                  ), 


                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange
                    ),
                    onPressed: (){}, child: Text('Conocer mas', style: TextStyle(color: Colors.black),)
                  )
                ],
              ),
            )
          ),
         ),
       )
      ],
    );
  }
}

class ImageRowLast extends StatelessWidget {
  const ImageRowLast({
    super.key,
    required this.imageListTile,
    required this.title,
    required this.description,
  });

  final AsyncValue<List<ImageEntity>> imageListTile;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
  
       Expanded(
         child: Card(
          shadowColor: Colors.red,
           child: SizedBox(
            height: 220,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title
                    , style: TextStyle(fontSize: 20, color: Colors.amber),
                  ),
                  
                  Text(
                    description,
                    maxLines: 7,
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.justify,
                  ),


                   ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange
                    ),
                    onPressed: (){}, child: Text('Conocer mas', style: TextStyle(color: Colors.black),)
                  )
                ],
              ),
            )
          ),
         ),
       ),

        imageListTile.when(
          data: (data) => Slide(image: data[0]),
          error: (e,r) => Text('$e'),
          loading: () => Skeletonizer(
            enabled: true,
            child: Slide(image: ImageEntity(description: '', url: 'https://i.etsystatic.com/16237790/r/il/591da5/5840470695/il_570xN.5840470695_gwx4.jpg')),
          )
        ),
      ],
    );
  }
}