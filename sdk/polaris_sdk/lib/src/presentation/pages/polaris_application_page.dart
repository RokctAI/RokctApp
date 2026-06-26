import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../application/polaris/polaris_provider.dart';
import '../../application/polaris/polaris_state.dart';
import '../../models/data/polaris_models.dart';
import '../widgets/steps/step_1_affordability.dart';
import '../widgets/steps/step_2_personal_details.dart';
import '../widgets/steps/step_3_document_upload.dart';
import '../widgets/steps/step_4_contract_review.dart';
import '../widgets/steps/step_5_consent_submission.dart';
import '../widgets/steps/step_6_outcome.dart';

class PolarisApplicationPage extends ConsumerStatefulWidget {
  const PolarisApplicationPage({Key? key}) : super(key: key);

  @override
  ConsumerState<PolarisApplicationPage> createState() =>
      _PolarisApplicationPageState();
}

class _PolarisApplicationPageState
    extends ConsumerState<PolarisApplicationPage> {
  // Assuming a mocked "pending" status initially for the outcome step once submitted
  LoanApplicationStatus _finalStatus = LoanApplicationStatus.pending;

  void _nextStep() {
    final currentStep = ref.read(applicationStepProvider);
    if (currentStep < 5) {
      ref.read(applicationStepProvider.notifier).state = currentStep + 1;
    }
  }

  void _onCancel() {
    Navigator.of(context).pop();
  }

  void _onFinish() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final currentStep = ref.watch(applicationStepProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Loan Application'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: _onCancel,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Progress Indicator
            if (currentStep < 5)
              LinearProgressIndicator(value: (currentStep + 1) / 6.0),
            Expanded(child: _buildStep(currentStep)),
          ],
        ),
      ),
    );
  }

  Widget _buildStep(int stepIndex) {
    switch (stepIndex) {
      case 0:
        return Step1Affordability(onNext: _nextStep, onCancel: _onCancel);
      case 1:
        return Step2PersonalDetails(onNext: _nextStep);
      case 2:
        return Step3DocumentUpload(onNext: _nextStep);
      case 3:
        return Step4ContractReview(onNext: _nextStep);
      case 4:
        return Step5ConsentSubmission(
          onNext: () {
            // In a real app we'd fetch the status or it might be returned directly
            setState(() {
              _finalStatus = LoanApplicationStatus.pending; // Mock outcome
            });
            _nextStep();
          },
        );
      case 5:
        return Step6Outcome(status: _finalStatus, onFinish: _onFinish);
      default:
        return const Center(child: Text('Unknown Step'));
    }
  }
}
