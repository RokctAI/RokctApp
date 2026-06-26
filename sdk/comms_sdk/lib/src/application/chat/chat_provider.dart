import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:comms_sdk/comms_sdk.dart';

final chatProvider = NotifierProvider<ChatNotifier, ChatState>(
  () => ChatNotifier(),
);
