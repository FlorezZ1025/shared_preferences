import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/dog_breed.dart';

class ApiService {
  // URL base de The Dog API
  static const String _baseUrl = 'https://api.thedogapi.com/v1';

  // Método para obtener la lista de razas de perros
  Future<List<DogBreed>> fetchDogBreeds() async {
    final response = await http.get(Uri.parse('$_baseUrl/breeds'));

    // Verificar si la solicitud fue exitosa
    if (response.statusCode == 200) {
      // Decodificar el JSON y mapearlo a una lista de DogBreed
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => DogBreed.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load dog breeds');
    }
  }
}
