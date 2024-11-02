class DogBreed {
  final String id;
  final String name;
  final String referenceImageId;
  final String imageUrl;

  DogBreed({
    required this.id,
    required this.name,
    required this.referenceImageId,
    this.imageUrl = '',
  });

  factory DogBreed.fromJson(Map<String, dynamic> json) {
    return DogBreed(
      id: json['id'].toString(),  
      name: json['name'] ?? 'Unknown Breed',
      referenceImageId: json['reference_image_id']?.toString() ?? '',  // Convertimos a String si es int o String
    );
  }

  DogBreed copyWithImageUrl(String imageUrl) {
    return DogBreed(
      id: id,
      name: name,
      referenceImageId: referenceImageId,
      imageUrl: imageUrl,
    );
  }
}
