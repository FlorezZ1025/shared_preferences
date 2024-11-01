import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/dog_breed.dart';
import '../services/api_service.dart';

// Definimos el proveedor como un StateNotifier
class DogBreedsNotifier extends StateNotifier<AsyncValue<List<DogBreed>>> {
  final ApiService apiService;

  DogBreedsNotifier({required this.apiService}) : super(const AsyncValue.loading()) {
    fetchDogBreeds();
  }

  // Método para obtener las razas de perros y actualizar el estado
  Future<void> fetchDogBreeds() async {
    try {
      final breeds = await apiService.fetchDogBreeds();
      state = AsyncValue.data(breeds);
    } catch (e) {
      state = AsyncValue.error(e,StackTrace.current);
    }
  }
}

// Creamos una instancia de ApiService
final apiServiceProvider = Provider((ref) => ApiService());

// Definimos el proveedor de DogBreedsNotifier
final dogBreedsProvider = StateNotifierProvider<DogBreedsNotifier, AsyncValue<List<DogBreed>>>(
  (ref) => DogBreedsNotifier(apiService: ref.watch(apiServiceProvider)),
);
