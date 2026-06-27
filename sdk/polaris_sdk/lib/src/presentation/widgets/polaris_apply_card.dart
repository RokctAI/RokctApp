import '../../../polaris_sdk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/polaris_sdk_core.dart';
import '../../application/polaris/polaris_provider.dart';
import '../../application/polaris/polaris_state.dart';

class PolarisApplyCard extends ConsumerStatefulWidget {
  final VoidCallback onApply;

  const PolarisApplyCard({Key? key, required this.onApply}) : super(key: key);

  @override
  ConsumerState<PolarisApplyCard> createState() => _PolarisApplyCardState();
}

class _PolarisApplyCardState extends ConsumerState<PolarisApplyCard>
    with SingleTickerProviderStateMixin {
  bool _expanded = false;

  void _handleInteraction() {
    if (!_expanded) {
      setState(() {
        _expanded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!PolarisSDK.instance.isInitialized) {
      return const SizedBox.shrink();
    }

    final session = ref.watch(polarisSessionProvider);
    if (!session.isEligibleToApply || session.hasActiveLoan) {
      return const SizedBox.shrink();
    }

    final config = PolarisSDK.instance.config;
    final theme = config.theme;
    final params = ref.watch(loanCalculatorParamsProvider);
    final breakdown = ref.watch(loanBreakdownProvider);

    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Need a loan?',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: theme.primaryColor,
                ),
              ),
              const SizedBox(height: 16),

              // Amount Slider
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Amount'),
                  Text(
                    'R${params.amount.toStringAsFixed(2)}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Slider(
                value: params.amount,
                min: config.minLoanAmount,
                max: config.maxLoanAmount,
                activeColor: theme.primaryColor,
                onChanged: (val) {
                  _handleInteraction();
                  ref
                      .read(loanCalculatorParamsProvider.notifier)
                      .updateAmount(val);
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('R${config.minLoanAmount.toStringAsFixed(0)}'),
                  Text('R${config.maxLoanAmount.toStringAsFixed(0)}'),
                ],
              ),

              const SizedBox(height: 16),

              // Term Slider
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Term'),
                  Text(
                    '${params.termDays} days',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Slider(
                value: params.termDays.toDouble(),
                min: config.minTermDays.toDouble(),
                max: config.maxTermDays.toDouble(),
                activeColor: theme.primaryColor,
                divisions: (config.maxTermDays - config.minTermDays) > 0
                    ? (config.maxTermDays - config.minTermDays)
                    : null,
                onChanged: (val) {
                  _handleInteraction();
                  ref
                      .read(loanCalculatorParamsProvider.notifier)
                      .updateTerm(val.toInt());
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${config.minTermDays} days'),
                  Text('${config.maxTermDays} days'),
                ],
              ),

              // Expanded Section
              AnimatedSize(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                child: _expanded && breakdown != null
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(height: 24),
                          const Divider(),
                          const SizedBox(height: 8),
                          _buildBreakdownRow(
                            'Capital:',
                            'R${breakdown.capital.toStringAsFixed(2)}',
                          ),
                          _buildBreakdownRow(
                            'Initiation Fee:',
                            'R${breakdown.initiationFee.toStringAsFixed(2)}',
                          ),
                          _buildBreakdownRow(
                            'Service Fee:',
                            'R${breakdown.serviceFee.toStringAsFixed(2)}',
                          ),
                          _buildBreakdownRow(
                            'Interest:',
                            'R${breakdown.interest.toStringAsFixed(2)}',
                          ),
                          _buildBreakdownRow(
                            'VAT:',
                            'R${breakdown.vat.toStringAsFixed(2)}',
                          ),
                          const SizedBox(height: 8),
                          _buildBreakdownRow(
                            'Total Repayable:',
                            'R${breakdown.totalRepayable.toStringAsFixed(2)}',
                            isBold: true,
                          ),
                          const SizedBox(height: 4),
                          _buildBreakdownRow(
                            'Due Date:',
                            '${breakdown.dueDate.year}-${breakdown.dueDate.month.toString().padLeft(2, '0')}-${breakdown.dueDate.day.toString().padLeft(2, '0')}',
                            color: theme.accentColor,
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: widget.onApply,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: theme.primaryColor,
                              foregroundColor:
                                  theme.primaryColor.computeLuminance() > 0.5
                                  ? Color(0xFF000000)
                                  : Color(0xFFFFFFFF),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              minimumSize: const Size(
                                48,
                                48,
                              ), // Min touch target
                            ),
                            child: const Text(
                              'Apply Now',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      )
                    : const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBreakdownRow(
    String label,
    String value, {
    bool isBold = false,
    Color? color,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
