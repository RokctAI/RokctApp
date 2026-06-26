import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:agent_sdk/agent_sdk.dart';

final aiTranslationProvider =
    StateNotifierProvider<AiTranslationNotifier, AiTranslationState>(
      (ref) => AiTranslationNotifier(),
    );
