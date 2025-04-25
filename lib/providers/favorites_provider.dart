import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';

class FavoritesMealNotifier extends StateNotifier<List<Meal>> {
  FavoritesMealNotifier() : super([]);

  bool toggleMealFavoriteStatus(Meal meal) {
    final mealsIsFavorite = state.contains(meal);

    if (mealsIsFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoritesMealProvider =
    StateNotifierProvider<FavoritesMealNotifier, List<Meal>>((ref) {
      return FavoritesMealNotifier();
    });
