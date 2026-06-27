import 'dart:convert';
import 'package:core_sdk/core_sdk.dart';
import '../../models/data/polaris_models.dart';

class PolarisDraftStorage {
  static const String _draftKey = 'polaris_application_draft';

  Future<void> saveDraft(LoanApplicationPayload payload) async {
    final db = AppDatabase();
    final jsonMap = payload.toJson();
    await db.putItem('settings', _draftKey, jsonMap);
  }

  Future<LoanApplicationPayload?> getDraft() async {
    final db = AppDatabase();
    final items = await db.getAll('settings');

    for (final item in items) {
      if (item['id'] == _draftKey) {
        try {
          final Map<String, dynamic> jsonMap = item['data'] is String
              ? jsonDecode(item['data'])
              : item['data'];
          return LoanApplicationPayload.fromJson(jsonMap);
        } catch (e) {
          await clearDraft();
          return null;
        }
      }
    }
    return null;
  }

  Future<void> clearDraft() async {
    final db = AppDatabase();
    await db.deleteItem('settings', _draftKey);
  }
}
