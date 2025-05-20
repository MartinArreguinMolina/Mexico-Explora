

import 'package:mexico_explora/infraestructure/entities/image_entity.dart';
import 'package:mexico_explora/infraestructure/models/images_response.dart';

class ImageMapper {
  ImageMapper(Photo photo);

  static ImageEntity casToEntity (Photo photoReponse) => 
  ImageEntity(description: photoReponse.alt, url: photoReponse.src.original);
}