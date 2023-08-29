import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class MealsDetailScreen extends StatelessWidget {
  const MealsDetailScreen({super.key, required this.meal, required this.onToggleFavorite});

  final Meal meal;
  final void Function(Meal meal) onToggleFavorite;


  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(onPressed: (){
            onToggleFavorite(meal);
          }, icon: const Icon(Icons.star))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(
              meal.imageUrl,
              width: width,
              height: 300,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 14,
            ),
            Text(
              'Ingredient',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 14,
            ),
            for (final ingredient in meal.ingredients)
              Text(
                ingredient,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),

            /// Step's

            const SizedBox(
              height: 14,
            ),
            Text(
              'Steps',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold),
            ),
            for (final steps in meal.steps)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Text(
                  steps,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
