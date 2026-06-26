import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'favorites_notifier.dart';
import 'favorites_state.dart';

final shopFavoritesProvider = NotifierProvider<FavoritesNotifier, FavoritesState>(
  () => FavoritesNotifier("shop"),
);
