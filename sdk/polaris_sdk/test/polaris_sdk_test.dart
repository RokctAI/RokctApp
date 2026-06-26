import 'package:flutter_test/flutter_test.dart';
import 'package:polaris_sdk/polaris_sdk.dart';

void main() {
  test('LendingSDK basic instantiation test', () {
    final sdk = LendingSDK();
    expect(sdk, isNotNull);
  });
}
