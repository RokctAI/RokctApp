import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:delivery_sdk/src/application/story/story_notifier.dart';
import 'package:delivery_sdk/src/application/story/story_state.dart';

final storyProvider = StateNotifierProvider<StoryNotifier, StoryState>(
  (ref) => StoryNotifier(),
);

