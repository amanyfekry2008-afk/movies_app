import 'package:movies_app/core/utils/app_images.dart';

class CastModel {
  final String image;
  final String name;
  final String character;

  const CastModel({
    required this.image,
    required this.name,
    required this.character,
  });
}

final cast = [
  CastModel(
    image: AppImages.avatar,
    name: 'Hayley Atwell',
    character: 'Captain Carter',
  ),
  CastModel(
    image: AppImages.avatar,
    name: 'Elizabeth Olsen',
    character: 'Wanda Maximoff / The Scarlet Witch',
  ),
  CastModel(
    image: AppImages.avatar,
    name: 'Rachel McAdams',
    character: 'Dr. Christine Palmer',
  ),
];
