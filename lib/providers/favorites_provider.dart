import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);
  
  bool toggleMealFavoriteStatus(Meal meal){
    final isContains = state.contains(meal);
    if(isContains){
      state = state.where((element) => element.id != meal.id).toList();
      return false;
    }else{
      state = [...state,meal];
      return true;
    }
  }

}

final favoriteMealsProvider = StateNotifierProvider<FavoriteMealsNotifier,List<Meal>>((ref) => FavoriteMealsNotifier());