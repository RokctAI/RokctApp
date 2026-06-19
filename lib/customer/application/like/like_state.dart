import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rokctapp/customer/models/models.dart';

part 'like_state.freezed.dart';

@freezed
sealed class LikeState with _$LikeState {
  const factory LikeState({
    @Default(true) bool isShopLoading,
    @Default([]) List<ShopData> shops,
  }) = _LikeState;

  const LikeState._();
}
