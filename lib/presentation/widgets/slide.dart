import 'package:flutter/material.dart';
import 'package:mexico_explora/infraestructure/entities/image_entity.dart';

class Slide extends StatelessWidget {

  final ImageEntity image;

  const Slide({super.key,  required this.image });

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.symmetric( horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          //* Imagen
          SizedBox(
            width: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: GestureDetector(
                // onTap: () => context.push('/home/0/movie/${ movie.id }'),
                child: FadeInImage(
                  height: 220,
                  fit: BoxFit.cover,
                  placeholder: const AssetImage('assets/loaders/bottle-loader.gif'), 
                  image: NetworkImage(image.url)
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}