import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:rokctapp/manager/infrastructure/services/services.dart';

part 'delivery_type_state.freezed.dart';

@freezed
sealed class DeliveryTypeState with _$DeliveryTypeState {
  const factory DeliveryTypeState({@Default(TrKeys.delivery) String type}) =
      _DeliveryTypeState;

  const DeliveryTypeState._();
}
