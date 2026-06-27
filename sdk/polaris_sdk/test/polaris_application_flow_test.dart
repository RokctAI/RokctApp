import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:polaris_sdk/src/core/polaris_sdk_core.dart';
import 'package:polaris_sdk/src/domain/bridges/polaris_wallet_bridge.dart';
import 'package:polaris_sdk/src/models/data/polaris_models.dart';
import 'package:polaris_sdk/src/infrastructure/repositories/mock_polaris_repository_impl.dart';
import 'package:polaris_sdk/src/presentation/pages/polaris_application_page.dart';
import 'package:polaris_sdk/src/di/polaris_di.dart';
import 'package:get_it/get_it.dart';

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
      userPrefill: PolarisUserPrefill(
        firstName: 'John',
        lastName: 'Doe',
        idNumber: '123456789',
        phone: '5551234',
      ),
      repository: MockPolarisRepositoryImpl(),
    );
  });

  testWidgets('PolarisApplicationPage multi-step flow test', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const ProviderScope(child: MaterialApp(home: PolarisApplicationPage())),
    );

    // Initial render might take a frame
    await tester.pumpAndSettle();

    // Step 1: Affordability Check
    expect(find.text('Step 1: Affordability Check'), findsOneWidget);

    // Fill in income and expenses to pass affordability
    await tester.enterText(
      find.widgetWithText(TextField, 'Monthly Income (Net)'),
      '20000',
    );
    await tester.enterText(
      find.widgetWithText(TextField, 'Monthly Living Expenses'),
      '5000',
    );
    await tester.enterText(
      find.widgetWithText(TextField, 'Other Monthly Debt Obligations'),
      '1000',
    );
    await tester.tap(find.text('Check Affordability'));
    await tester.pumpAndSettle();

    // Step 2: Personal Details
    expect(find.text('Step 2: Personal Details'), findsOneWidget);
    expect(find.text('First Name: John'), findsOneWidget);
    await tester.tap(find.text('Confirm and Continue'));
    await tester.pumpAndSettle();

    // Step 3: Document Upload
    expect(find.text('Step 3: Document Upload'), findsOneWidget);
    // Find all upload buttons and tap them
    final uploadButtons = find.text('Upload');
    expect(uploadButtons, findsNWidgets(4));

    await tester.tap(uploadButtons.first);
    await tester.pumpAndSettle();
    await tester.tap(uploadButtons.first);
    await tester.pumpAndSettle();
    await tester.tap(uploadButtons.first);
    await tester.pumpAndSettle();
    await tester.tap(uploadButtons.first);
    await tester.pumpAndSettle();

    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle();

    // Step 4: Contract Review
    expect(find.text('Step 4: Contract Review'), findsOneWidget);
    // Simulate scroll to bottom by finding the scrollable and dragging
    await tester.drag(
      find.byType(SingleChildScrollView),
      const Offset(0, -3000),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('I have read and agree to the terms'));
    await tester.pumpAndSettle();

    // Step 5: Consent & Submission
    expect(find.text('Step 5: Consent & Submission'), findsOneWidget);

    // Tap the checkbox using finding by text (its title)
    await tester.tap(find.text('I consent to the DebiCheck mandate.'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Submit Application'));
    // Wait for the mock future to complete
    await tester.pumpAndSettle(const Duration(seconds: 2));

    // Step 6: Outcome
    expect(find.text('Application Pending'), findsOneWidget);
  });
}
