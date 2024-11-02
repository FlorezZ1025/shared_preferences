import 'package:dogs_app/widgets/dog_breed_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/dog_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dogBreedsAsyncValue = ref.watch(dogBreedsProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[700],
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Dog Breeds',
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 251, 251, 249)),
        ),
      ),
      body: dogBreedsAsyncValue.when(
        data: (breeds) => ListView.builder(
          itemCount: breeds.length,
          itemBuilder: (context, index) {
            final breed = breeds[index];
            return DogBreedCard(
              breedName: breed.name,
              imageUrl: breed.imageUrl,
            );
          },
        ),
        error: (Object error, StackTrace stackTrace) {
          return Center(
              child: Text('Failed to load breeds: $error $stackTrace'));
        },
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
