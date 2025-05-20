
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mexico_explora/infraestructure/datasource/image_response_data_source.dart';
import 'package:mexico_explora/infraestructure/entities/image_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'carousel_provider.g.dart';

@Riverpod(keepAlive: true)
Future<List<ImageEntity>> image (Ref ref, int perPage, String query, bool landscape) async{
  final images = await ImageResponseDataSource().getImages(perPage: perPage, query: query, landscape: landscape);
  return images;
}