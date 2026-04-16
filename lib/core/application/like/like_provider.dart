import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rokctapp/core/application/like/like_notifier.dart';
import 'package:rokctapp/core/application/like/like_state.dart';

final likeProvider = NotifierProvider<LikeNotifier, LikeState>(
  () => LikeNotifier(),
);
