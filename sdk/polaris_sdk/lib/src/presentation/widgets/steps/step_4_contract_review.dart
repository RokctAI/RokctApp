import '../../../../polaris_sdk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../application/polaris/polaris_provider.dart';
import '../../../application/polaris/polaris_state.dart';
import '../../../core/polaris_sdk_core.dart';

class Step4ContractReview extends ConsumerStatefulWidget {
  final VoidCallback onNext;

  const Step4ContractReview({Key? key, required this.onNext}) : super(key: key);

  @override
  ConsumerState<Step4ContractReview> createState() =>
      _Step4ContractReviewState();
}

class _Step4ContractReviewState extends ConsumerState<Step4ContractReview> {
  final _scrollController = ScrollController();
  bool _hasScrolledToBottom = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 50) {
      if (!_hasScrolledToBottom) {
        setState(() {
          _hasScrolledToBottom = true;
        });
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final breakdown = ref.watch(loanBreakdownProvider);
    final theme = PolarisSDK.instance.config.theme;

    if (breakdown == null) return const SizedBox.shrink();

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Step 4: Contract Review',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(color: theme.primaryColor.withOpacity(0.1)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Scrollbar(
              controller: _scrollController,
              thumbVisibility: true,
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'LOAN AGREEMENT',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text('This is a binding agreement...'),
                    const SizedBox(height: 300), // Simulate long text
                    Text(
                      'Total Repayable: R${breakdown.totalRepayable.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: theme.accentColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 100), // Simulate long text
                    Text(
                      'Due Date: ${breakdown.dueDate.toIso8601String().split('T').first}',
                      style: TextStyle(
                        color: theme.accentColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 300), // Simulate long text
                    Text(
                      'Initiation Fee: R${breakdown.initiationFee.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: theme.accentColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 200), // Simulate long text
                    const Text('By confirming, you agree to these terms.'),
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: _hasScrolledToBottom ? widget.onNext : null,
            child: const Text('I have read and agree to the terms'),
          ),
        ),
      ],
    );
  }
}
