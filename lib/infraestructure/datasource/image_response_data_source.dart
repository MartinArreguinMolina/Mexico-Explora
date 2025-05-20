
import 'package:dio/dio.dart';
import 'package:mexico_explora/infraestructure/entities/image_entity.dart';
import 'package:mexico_explora/infraestructure/mappers/image_mapper.dart';
import 'package:mexico_explora/infraestructure/models/images_response.dart';

class ImageResponseDataSource {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.pexels.com/v1/',
    headers: {'Authorization': 'xsDSQVTwytrMjXadeZASMsekaz823zwH4hPaZLUN5Cab9ajlspKsPp8r',}
  ));


  Future<List<ImageEntity>> getImages ({required  int perPage, required String query,required bool landscape}) async{

    await Future.delayed(Duration(seconds: 1));

    final response = await dio.get('search', queryParameters: {
        'query': query,
        'per_page': perPage,
        'orientation': landscape ? 'landscape' : 'portrait '
    });

    final imageReponse = ImageReponse.fromJson(response.data);

    List<ImageEntity> imageEntity = imageReponse.photos.map((photo) => ImageMapper.casToEntity(photo)).toList();

    return imageEntity;
  }
}