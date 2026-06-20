import 'dart:async';

/// Defines the generalized operational states for any contract.
enum ProcessingState {
  draft,
  submitted,
  accepted,
  processing,
  ready,
  dispatched,
  active,
  completed,
  failed,
  cancelled,
}

/// Represents any contract (Order, Loan, Booking, Mission, etc.) passing through the orchestration engine.
abstract class ProcessingContract {
  String get contractId;
  String get contractType;
  ProcessingState get currentState;
  Map<String, dynamic> get metadata;
  DateTime get updatedAt;

  /// Check payment state without direct financial coupling.
  bool get isPaid;
}

/// A simple implementation of ProcessingContract for general or custom workflows.
class GenericContract implements ProcessingContract {
  @override
  final String contractId;
  @override
  final String contractType;
  @override
  final ProcessingState currentState;
  @override
  final Map<String, dynamic> metadata;
  @override
  final DateTime updatedAt;
  @override
  final bool isPaid;

  GenericContract({
    required this.contractId,
    required this.contractType,
    required this.currentState,
    this.metadata = const {},
    required this.updatedAt,
    this.isPaid = false,
  });

  GenericContract copyWith({
    String? contractId,
    String? contractType,
    ProcessingState? currentState,
    Map<String, dynamic>? metadata,
    DateTime? updatedAt,
    bool? isPaid,
  }) {
    return GenericContract(
      contractId: contractId ?? this.contractId,
      contractType: contractType ?? this.contractType,
      currentState: currentState ?? this.currentState,
      metadata: metadata ?? this.metadata,
      updatedAt: updatedAt ?? this.updatedAt,
      isPaid: isPaid ?? this.isPaid,
    );
  }
}

/// Represents a state change event published by the processing engine.
class ProcessingStateChangedEvent {
  final ProcessingContract contract;
  final ProcessingState previousState;
  final ProcessingState newState;
  final DateTime timestamp;

  ProcessingStateChangedEvent({
    required this.contract,
    required this.previousState,
    required this.newState,
    required this.timestamp,
  });

  @override
  String toString() {
    return 'ProcessingStateChangedEvent(id: ${contract.contractId}, type: ${contract.contractType}, $previousState -> $newState)';
  }
}

/// Generalized orchestration engine that validates and executes state transitions.
class ProcessingEngine {
  // Broadcaster for lifecycle events
  final _eventController = StreamController<ProcessingStateChangedEvent>.broadcast();

  Stream<ProcessingStateChangedEvent> get eventStream => _eventController.stream;

  /// Defines allowed transition paths. If the transition path isn't defined here, it is blocked.
  bool isValidTransition(ProcessingState from, ProcessingState to) {
    if (from == to) return true;

    // Terminal states cannot transition to any other states
    if (from == ProcessingState.completed ||
        from == ProcessingState.failed ||
        from == ProcessingState.cancelled) {
      return false;
    }

    switch (from) {
      case ProcessingState.draft:
        return to == ProcessingState.submitted || to == ProcessingState.cancelled;
      case ProcessingState.submitted:
        return to == ProcessingState.accepted ||
            to == ProcessingState.failed ||
            to == ProcessingState.cancelled;
      case ProcessingState.accepted:
        return to == ProcessingState.processing || to == ProcessingState.cancelled;
      case ProcessingState.processing:
        return to == ProcessingState.ready ||
            to == ProcessingState.dispatched ||
            to == ProcessingState.active ||
            to == ProcessingState.completed ||
            to == ProcessingState.failed;
      case ProcessingState.ready:
        return to == ProcessingState.dispatched ||
            to == ProcessingState.active ||
            to == ProcessingState.completed ||
            to == ProcessingState.cancelled;
      case ProcessingState.dispatched:
        return to == ProcessingState.active ||
            to == ProcessingState.completed ||
            to == ProcessingState.failed;
      case ProcessingState.active:
        return to == ProcessingState.completed ||
            to == ProcessingState.failed ||
            to == ProcessingState.cancelled;
      default:
        return false;
    }
  }

  /// Transitions a contract to a new state if valid.
  GenericContract transition(ProcessingContract contract, ProcessingState newState) {
    final previousState = contract.currentState;

    if (!isValidTransition(previousState, newState)) {
      throw StateError(
        'Invalid state transition: Cannot move contract ${contract.contractId} (${contract.contractType}) from $previousState to $newState.',
      );
    }

    final updated = GenericContract(
      contractId: contract.contractId,
      contractType: contract.contractType,
      currentState: newState,
      metadata: Map<String, dynamic>.from(contract.metadata),
      updatedAt: DateTime.now(),
      isPaid: contract.isPaid,
    );

    // Broadcast change event
    _eventController.add(
      ProcessingStateChangedEvent(
        contract: updated,
        previousState: previousState,
        newState: newState,
        timestamp: updated.updatedAt,
      ),
    );

    return updated;
  }

  void dispose() {
    _eventController.close();
  }
}
