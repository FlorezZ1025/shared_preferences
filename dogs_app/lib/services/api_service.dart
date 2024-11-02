import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/dog_breed.dart';

class ApiService {
  static const String _baseUrl = 'https://api.thedogapi.com/v1';

  Future<List<DogBreed>> fetchDogBreeds() async {
    final response = await http.get(Uri.parse('$_baseUrl/breeds'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);

      List<DogBreed> breeds = data.map((json) => DogBreed.fromJson(json)).toList();

      for (var i = 0; i < breeds.length; i++) {
        if (breeds[i].referenceImageId.isNotEmpty) {
          final imageUrl = await fetchImage(breeds[i].referenceImageId);
          breeds[i] = breeds[i].copyWithImageUrl(imageUrl);
        }
      }
      return breeds;
    } else {
      throw Exception('Failed to load dog breeds');
    }
  }

  Future<String> fetchImage(String referenceImageId) async {
    final response = await http.get(Uri.parse('$_baseUrl/images/$referenceImageId'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['url'] ?? ''; 
    } else {
      return '';
    }
  }
}
