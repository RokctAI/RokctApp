import 'package:flutter/foundation.dart';
@immutable
class FavoritesState {
  final bool isLoading;
  final List<int> savedIds;
  const FavoritesState({this.isLoading = false, this.savedIds = const []});
  FavoritesState copyWith({bool? isLoading, List<int>? savedIds}) {
    return FavoritesState(
      isLoading: isLoading ?? this.isLoading,
      savedIds: savedIds ?? this.savedIds,
    );
  }
}
