import 'package:polaris_sdk/polaris_sdk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoanStatusCard extends ConsumerWidget {
  const LoanStatusCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!PolarisSDK.instance.isInitialized) {
      return const SizedBox.shrink();
    }

    final activeLoanAsync = ref.watch(activeLoanProvider);

    return activeLoanAsync.when(
      data: (loan) {
        if (loan == null) return const SizedBox.shrink();

        final config = PolarisSDK.instance.config;
        final theme = config.theme;
        final now = DateTime.now();
        final totalDays = loan.dueDate.difference(loan.disbursedAt).inDays;
        final daysRemaining = loan.dueDate.difference(now).inDays;

        // Ensure progress is between 0 and 1
        double progress = 1.0;
        if (totalDays > 0) {
          progress = 1.0 - (daysRemaining / totalDays).clamp(0.0, 1.0);
        }

        return Card(
          elevation: 2,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Active Loan',
                      style: TextStyle(
                        fontSize: 16,
                        color: theme.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'R${loan.amountOwed.toStringAsFixed(2)} owed',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                LinearProgressIndicator(
                  value: progress,
                  backgroundColor: theme.primaryColor.withOpacity(0.1),
                  valueColor: AlwaysStoppedAnimation<Color>(
                    daysRemaining <= 3 ? theme.dangerColor : theme.primaryColor,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '$daysRemaining days remaining',
                      style: TextStyle(
                        color: daysRemaining <= 3
                            ? theme.dangerColor
                            : theme.primaryColor.withOpacity(0.6),
                        fontWeight: daysRemaining <= 3
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                    Text(
                      'Due: ${loan.dueDate.year}-${loan.dueDate.month.toString().padLeft(2, '0')}-${loan.dueDate.day.toString().padLeft(2, '0')}',
                      style: TextStyle(
                        color: theme.primaryColor.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (_, __) => const SizedBox.shrink(),
    );
  }
}
