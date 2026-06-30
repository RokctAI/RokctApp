import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:core_sdk/src/application/favorites/favorites_notifier.dart';
import 'package:core_sdk/src/application/favorites/favorites_state.dart';

final favoritesProvider = NotifierProvider<FavoritesNotifier, FavoritesState>(
  () => FavoritesNotifier(),
);

