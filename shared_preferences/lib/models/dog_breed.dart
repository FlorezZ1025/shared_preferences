class DogBreed {
  final String id;
  final String name;
  final String imageUrl;

  DogBreed({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  // Método para crear una instancia de DogBreed desde un JSON
  factory DogBreed.fromJson(Map<String, dynamic> json) {
    return DogBreed(
      id: json['id'],
      name: json['name'],
      imageUrl: json['image']['url'] ?? '', // Imagen puede no estar siempre disponible
    );
  }
}
