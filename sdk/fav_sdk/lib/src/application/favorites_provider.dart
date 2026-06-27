import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rokctapp/customer/application/favorites/favorites_notifier.dart';
import 'package:rokctapp/customer/application/favorites/favorites_state.dart';

final favoritesProvider = NotifierProvider<FavoritesNotifier, FavoritesState>(
  () => FavoritesNotifier(),
);
