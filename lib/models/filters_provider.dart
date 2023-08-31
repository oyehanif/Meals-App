import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/meals_provider.dart';
import 'package:meals/screens/filters.dart';

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegetarian: false,
          Filter.vegan: false,
        });

  void setFilters(Map<Filter, bool> chosenFilter) {
    state = chosenFilter;
  }

  void setFilter(Filter filter, bool isActive) {
    state = {...state, filter: isActive};
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
        (ref) => FiltersNotifier());

final filteredMealsProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final activeFilter = ref.watch(filtersProvider);
  return meals.where((element) {
    if (activeFilter[Filter.glutenFree]! && !element.isGlutenFree) {
      return false;
    }

    if (activeFilter[Filter.lactoseFree]! && !element.isLactoseFree) {
      return false;
    }

    if (activeFilter[Filter.vegetarian]! && !element.isVegetarian) {
      return false;
    }

    if (activeFilter[Filter.vegan]! && !element.isVegan) {
      return false;
    }
    return true;
  }).toList();
});
