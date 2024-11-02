import 'package:flutter/material.dart';

class DogBreedCard extends StatelessWidget {
  final String breedName;
  final String imageUrl;

  const DogBreedCard({
    super.key,
    required this.breedName,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 4,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12.0)),
            child: Image.network(
              imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => const Icon(Icons.pets),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              breedName,
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
