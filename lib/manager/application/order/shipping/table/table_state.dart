import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:rokctapp/manager/infrastructure/models/models.dart';

part 'table_state.freezed.dart';

@freezed
sealed class TableState with _$TableState {
  const factory TableState({
    @Default([]) List<TableData> tables,
    @Default(0) int selectedIndex,
    @Default(false) bool isLoading,
    TableData? selectTable,
    TextEditingController? textController,
  }) = _TableState;

  const TableState._();
}
