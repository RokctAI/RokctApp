import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:core_sdk/core_sdk.dart';
import 'favorites_state.dart';

class FavoritesNotifier extends Notifier<FavoritesState> {
  final String _favoriteType;
  FavoritesNotifier(this._favoriteType);

  @override
  FavoritesState build() {
    final saved = _loadSavedIds();
    return FavoritesState(savedIds: saved);
  }

  List<int> _loadSavedIds() {
    if (_favoriteType == "shop") {
      return LocalStorage.getSavedShopsList();
    }
    return [];
  }

  void _saveIds(List<int> ids) {
    if (_favoriteType == "shop") {
      LocalStorage.setSavedShopsList(ids);
    }
  }

  void toggle(int id) {
    final list = List<int>.from(state.savedIds);
    if (list.contains(id)) {
      list.remove(id);
    } else {
      list.add(id);
    }
    state = state.copyWith(savedIds: list);
    _saveIds(list);
  }

  bool isFavorite(int id) {
    return state.savedIds.contains(id);
  }
}
