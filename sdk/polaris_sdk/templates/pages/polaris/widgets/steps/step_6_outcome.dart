import '../../../application/polaris/polaris_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../polaris_sdk.dart';
import 'package:flutter/material.dart';
import '../../../models/data/polaris_models.dart';

class Step6Outcome extends ConsumerWidget {
  final LoanApplicationStatus status;
  final VoidCallback onFinish;

  const Step6Outcome({Key? key, required this.status, required this.onFinish})
    : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = PolarisSDK.instance.config;
    final theme = config.theme;
    IconData icon;
    Color color;
    String title;
    String message;

    switch (status) {
      case LoanApplicationStatus.approved:
        icon = Icons.check_circle;
        color = theme.successColor;
        title = 'Congratulations!';
        message =
            'Your loan has been approved and funds have been disbursed to your wallet.';
        break;
      case LoanApplicationStatus.declined:
        icon = Icons.cancel;
        color = theme.dangerColor;
        title = 'Application Declined';
        message =
            'Unfortunately, we cannot approve your application at this time. You may try again with a smaller amount.';
        break;
      case LoanApplicationStatus.pending:
      case LoanApplicationStatus.draft:
      default:
        icon = Icons.hourglass_empty;
        color = theme.accentColor;
        title = 'Application Pending';
        message =
            'Your application is being reviewed. We will notify you via the Comms SDK once a decision is made.';
        break;
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Icon(icon, size: 80, color: color),
          const SizedBox(height: 24),
          Text(
            title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 32),
          ElevatedButton(onPressed: onFinish, child: const Text('Finish')),
        ],
      ),
    );
  }
}
