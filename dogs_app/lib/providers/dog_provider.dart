import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/dog_breed.dart';
import '../services/api_service.dart';

class DogBreedsNotifier extends StateNotifier<AsyncValue<List<DogBreed>>> {
  final ApiService apiService;

  DogBreedsNotifier({required this.apiService}) : super(const AsyncValue.loading()) {
    fetchDogBreeds();
  }

  Future<void> fetchDogBreeds() async {
    try {
      final breeds = await apiService.fetchDogBreeds();
      state = AsyncValue.data(breeds);
    } catch (e) {
      state = AsyncValue.error(e,StackTrace.current);
    }
  }
}

final apiServiceProvider = Provider((ref) => ApiService());

final dogBreedsProvider = StateNotifierProvider<DogBreedsNotifier, AsyncValue<List<DogBreed>>>(
  (ref) => DogBreedsNotifier(apiService: ref.watch(apiServiceProvider)),
);
