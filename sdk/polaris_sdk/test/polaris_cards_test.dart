import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:core_sdk/core_sdk.dart';
import 'package:polaris_sdk/src/di/polaris_di.dart';
import 'package:get_it/get_it.dart';
import 'package:polaris_sdk/src/core/polaris_sdk_core.dart';
import 'package:polaris_sdk/src/domain/bridges/polaris_wallet_bridge.dart';
import 'package:polaris_sdk/src/models/data/polaris_models.dart';
import 'package:polaris_sdk/src/infrastructure/repositories/mock_polaris_repository_impl.dart';
import 'package:polaris_sdk/src/presentation/widgets/polaris_apply_card.dart';

class TestWalletBridge implements PolarisWalletBridge {
  @override
  Future<void> onInitiationFeeDebited(double amount, String reference) async {}

  @override
  Future<void> onLoanDisbursed(double amount, String reference) async {}

  @override
  Future<void> onRepaymentReceived(double amount, String reference) async {}
}

void main() {
  setUp(() {
    PolarisSdkDependencies.register(GetIt.instance);
    PolarisSDK.initialize(
      config: PolarisConfig(
        minLoanAmount: 100,
        maxLoanAmount: 5000,
        minTermDays: 7,
        maxTermDays: 30,
        initiationFeeRate: 0.15,
        serviceFeeFlat: 86.0,
        interestRatePerDay: 0.001,
        vatRate: 0.15,
        maxInitiationFee: 1150.0,
      ),
      session: PolarisSession(
        userId: 'test_user',
        authToken: 'token',
        hasActiveLoan: false,
        isEligibleToApply: true,
      ),
      walletBridge: TestWalletBridge(),
      userPrefill: PolarisUserPrefill(),
      repository: MockPolarisRepositoryImpl(),
    );
  });

  testWidgets('PolarisApplyCard renders collapsed state initially', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: Scaffold(body: PolarisApplyCard(onApply: () {})),
        ),
      ),
    );

    // Initial render might have sliders but no expanded breakdown
    expect(find.text('Need a loan?'), findsOneWidget);
    expect(find.text('Amount'), findsOneWidget);
    expect(find.text('Term'), findsOneWidget);

    // Should not see Total Repayable yet because it's not expanded
    expect(find.text('Total Repayable:'), findsNothing);
  });

  testWidgets('PolarisApplyCard expands on slider interaction', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: Scaffold(body: PolarisApplyCard(onApply: () {})),
        ),
      ),
    );

    // Find the first slider (Amount)
    final sliderFinder = find.byType(Slider).first;

    // Interact with it
    await tester.tap(sliderFinder);
    await tester.pumpAndSettle();

    // Now breakdown should be visible
    expect(find.text('Total Repayable:'), findsOneWidget);
    expect(find.text('Apply Now'), findsOneWidget);
  });
}
