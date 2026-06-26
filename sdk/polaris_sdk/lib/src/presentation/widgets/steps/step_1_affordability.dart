import '../../../../polaris_sdk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../application/polaris/polaris_provider.dart';
import '../../../application/polaris/polaris_state.dart';

class Step1Affordability extends ConsumerStatefulWidget {
  final VoidCallback onNext;
  final VoidCallback onCancel;

  const Step1Affordability({
    Key? key,
    required this.onNext,
    required this.onCancel,
  }) : super(key: key);

  @override
  ConsumerState<Step1Affordability> createState() => _Step1AffordabilityState();
}

class _Step1AffordabilityState extends ConsumerState<Step1Affordability> {
  final _incomeController = TextEditingController();
  final _expensesController = TextEditingController();
  final _obligationsController = TextEditingController();
  bool _rejected = false;

  void _checkAffordability() {
    final income = double.tryParse(_incomeController.text) ?? 0;
    final expenses = double.tryParse(_expensesController.text) ?? 0;
    final obligations = double.tryParse(_obligationsController.text) ?? 0;

    final disposableIncome = income - expenses - obligations;
    final loanBreakdown = ref.read(loanBreakdownProvider);

    // Simplistic check: Disposable income must be at least the total repayable amount
    final isAffordable =
        loanBreakdown != null &&
        disposableIncome >= loanBreakdown.totalRepayable;

    ref.read(affordabilityProvider.notifier).state = AffordabilityState(
      disposableIncome: disposableIncome,
      isAffordable: isAffordable,
      monthlyIncome: income,
      monthlyExpenses: expenses + obligations,
    );

    if (isAffordable) {
      widget.onNext();
    } else {
      setState(() {
        _rejected = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final config = PolarisSDK.instance.config;
    final theme = config.theme;
    if (_rejected) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(Icons.info_outline, size: 64, color: theme.accentColor),
            const SizedBox(height: 16),
            const Text(
              'We cannot proceed with this application',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            const Text(
              'Based on your provided financial details, you currently do not have sufficient disposable income to afford the selected loan amount.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: widget.onCancel,
              child: const Text('Go back and reduce loan amount'),
            ),
          ],
        ),
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Step 1: Affordability Check',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _incomeController,
            decoration: const InputDecoration(
              labelText: 'Monthly Income (Net)',
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _expensesController,
            decoration: const InputDecoration(
              labelText: 'Monthly Living Expenses',
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _obligationsController,
            decoration: const InputDecoration(
              labelText: 'Other Monthly Debt Obligations',
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: _checkAffordability,
            child: const Text('Check Affordability'),
          ),
        ],
      ),
    );
  }
}
