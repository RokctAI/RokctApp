import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/polaris_sdk_core.dart';
import '../../../models/data/polaris_models.dart';
import '../../../application/polaris/polaris_provider.dart';
import '../../../application/polaris/polaris_state.dart';

class Step2PersonalDetails extends ConsumerStatefulWidget {
  final VoidCallback onNext;

  const Step2PersonalDetails({Key? key, required this.onNext})
    : super(key: key);

  @override
  ConsumerState<Step2PersonalDetails> createState() =>
      _Step2PersonalDetailsState();
}

class _Step2PersonalDetailsState extends ConsumerState<Step2PersonalDetails> {
  late TextEditingController _idController;
  late TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    final prefill = PolarisSDK.instance.userPrefill;
    _idController = TextEditingController(text: prefill.idNumber ?? '');
    _phoneController = TextEditingController(text: prefill.phone ?? '');
  }

  @override
  Widget build(BuildContext context) {
    final prefill = PolarisSDK.instance.userPrefill;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Step 2: Personal Details',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          if (prefill.firstName != null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text('First Name: ${prefill.firstName}'),
            ),
          if (prefill.lastName != null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text('Last Name: ${prefill.lastName}'),
            ),
          TextField(
            controller: _idController,
            decoration: const InputDecoration(labelText: 'ID Number'),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _phoneController,
            decoration: const InputDecoration(labelText: 'Phone Number'),
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () async {
              // Create a partial payload just to save to draft
              final params = ref.read(loanCalculatorParamsProvider);
              final aff = ref.read(affordabilityProvider);

              if (aff != null) {
                final payload = LoanApplicationPayload(
                  amount: params.amount,
                  termDays: params.termDays,
                  idNumber: _idController.text,
                  monthlyIncome: aff.monthlyIncome,
                  monthlyExpenses: aff.monthlyExpenses,
                );
                await ref
                    .read(applicationDraftProvider.notifier)
                    .saveDraft(payload);
              }

              widget.onNext();
            },
            child: const Text('Confirm and Continue'),
          ),
        ],
      ),
    );
  }
}
