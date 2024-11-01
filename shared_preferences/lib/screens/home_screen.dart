import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/dog_provider.dart';
import '../models/dog_breed.dart';

class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dogBreedsAsyncValue = ref.watch(dogBreedsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dog Breeds'),
      ),
      body: dogBreedsAsyncValue.when(
        data: (breeds) => ListView.builder(
          itemCount: breeds.length,
          itemBuilder: (context, index) {
            final breed = breeds[index];
            return ListTile(
              leading: breed.imageUrl.isNotEmpty
                  ? Image.network(breed.imageUrl, width: 50, height: 50, fit: BoxFit.cover)
                  : null,
              title: Text(breed.name),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Failed to load breeds: $error')),
      ),
    );
  }
}
