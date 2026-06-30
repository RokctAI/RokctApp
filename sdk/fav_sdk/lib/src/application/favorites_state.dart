import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:core_sdk/src/models/models.dart';

part 'favorites_state.freezed.dart';

@freezed
sealed class FavoritesState with _$FavoritesState {
  const factory FavoritesState({
    @Default(true) bool isShopLoading,
    @Default([]) List<MerchantData> shops,
  }) = _FavoritesState;

  const FavoritesState._();
}

