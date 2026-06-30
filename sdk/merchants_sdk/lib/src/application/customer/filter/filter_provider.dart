import 'package:flutter_riverpod/flutter_riverpod.dart';

final filterProvider = NotifierProvider<FilterNotifier, FilterState>(
  () => FilterNotifier(),
);
