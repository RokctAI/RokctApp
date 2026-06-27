import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:polaris_sdk/polaris_sdk.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class AppPage extends ConsumerStatefulWidget {
  const AppPage({Key? key}) : super(key: key);

  @override
  ConsumerState<AppPage> createState() =>
      _AppPageState();
}

class _AppPageState
    extends ConsumerState<AppPage> {
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
            if (currentStep < 5)
              LinearProgressIndicator(value: (currentStep + 1) / 6.0),
            Expanded(child: _buildStep(currentStep)),
          ],
        ),
      ),
    );
  }

  Widget _buildStep(int stepIndex) {
    // Note: Widgets are imported/used from package:polaris_sdk/polaris_sdk.dart
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
            setState(() {
              _finalStatus = LoanApplicationStatus.pending;
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
