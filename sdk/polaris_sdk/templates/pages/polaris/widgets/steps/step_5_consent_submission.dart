import '../../../../polaris_sdk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../application/polaris/polaris_provider.dart';
import '../../../application/polaris/polaris_state.dart';
import '../../../models/data/polaris_models.dart';
import '../../../core/polaris_sdk_core.dart';

class Step5ConsentSubmission extends ConsumerStatefulWidget {
  final VoidCallback onNext;

  const Step5ConsentSubmission({Key? key, required this.onNext})
    : super(key: key);

  @override
  ConsumerState<Step5ConsentSubmission> createState() =>
      _Step5ConsentSubmissionState();
}

class _Step5ConsentSubmissionState
    extends ConsumerState<Step5ConsentSubmission> {
  bool _mandateConsented = false;
  bool _isSubmitting = false;

  Future<void> _submit() async {
    setState(() {
      _isSubmitting = true;
    });

    try {
      final breakdown = ref.read(loanBreakdownProvider);
      final params = ref.read(loanCalculatorParamsProvider);
      final aff = ref.read(affordabilityProvider);

      if (breakdown == null || aff == null) throw Exception('Missing data');

      final payload = LoanApplicationPayload(
        amount: params.amount,
        termDays: params.termDays,
        idNumber: PolarisSDK.instance.userPrefill.idNumber ?? '0000',
        monthlyIncome: aff.monthlyIncome,
        monthlyExpenses: aff.monthlyExpenses,
      );

      await PolarisSDK.instance.repository.submitApplication(payload);

      // Clear draft state if any
      await ref.read(applicationDraftProvider.notifier).clearDraft();

      widget.onNext();
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Submission failed: $e')));
    } finally {
      if (mounted) {
        setState(() {
          _isSubmitting = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final config = PolarisSDK.instance.config;
    final theme = config.theme;
    final breakdown = ref.watch(loanBreakdownProvider);
    if (breakdown == null) return const SizedBox.shrink();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Step 5: Consent & Submission',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Summary',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text('Amount: R${breakdown.capital.toStringAsFixed(2)}'),
                  Text(
                    'Total Cost: R${breakdown.totalRepayable.toStringAsFixed(2)}',
                  ),
                  Text(
                    'Due Date: ${breakdown.dueDate.toIso8601String().split('T').first}',
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          CheckboxListTile(
            title: const Text('I consent to the DebiCheck mandate.'),
            value: _mandateConsented,
            onChanged: (val) {
              setState(() {
                _mandateConsented = val ?? false;
              });
            },
          ),
          const SizedBox(height: 16),
          Text(
            'Notice: An initiation fee of R${breakdown.initiationFee.toStringAsFixed(2)} will be debited immediately upon approval.',
            style: TextStyle(color: theme.dangerColor),
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: (_mandateConsented && !_isSubmitting) ? _submit : null,
            child: _isSubmitting
                ? const CircularProgressIndicator()
                : const Text('Submit Application'),
          ),
        ],
      ),
    );
  }
}
