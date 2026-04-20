import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/manager/application/ai_translation/ai_translation_notifier.dart';
import 'package:rokctapp/manager/application/ai_translation/ai_translation_state.dart';

final aiTranslationProvider =
    StateNotifierProvider<AiTranslationNotifier, AiTranslationState>(
      (ref) => AiTranslationNotifier(),
    );
