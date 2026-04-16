import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/core/application/add_card/add_card_notifier.dart';
import 'package:rokctapp/core/application/add_card/add_card_state.dart';

final addCardProvider = NotifierProvider<AddCardNotifier, AddCardState>(
  () => AddCardNotifier(),
);
