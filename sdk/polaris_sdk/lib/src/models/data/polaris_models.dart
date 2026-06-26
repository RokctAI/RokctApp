import 'package:flutter/material.dart';

class PolarisConfig {
  final double minLoanAmount;
  final double maxLoanAmount;
  final int minTermDays;
  final int maxTermDays;
  final double initiationFeeRate; // e.g. 0.15 (15%)
  final double serviceFeeFlat; // e.g. 86.00
  final double interestRatePerDay; // e.g. 0.001 (0.1% per day)
  final double vatRate; // e.g. 0.15
  final double maxInitiationFee; // NCR cap

  PolarisTheme theme;

  PolarisConfig({
    required this.minLoanAmount,
    required this.maxLoanAmount,
    required this.minTermDays,
    required this.maxTermDays,
    required this.initiationFeeRate,
    required this.serviceFeeFlat,
    required this.interestRatePerDay,
    required this.vatRate,
    required this.maxInitiationFee,
    PolarisTheme? theme,
  }) : theme = theme ?? PolarisTheme.defaultTheme();
}

class PolarisTheme {
  final Color primaryColor;
  final Color accentColor;
  final Color dangerColor;
  final Color successColor;

  PolarisTheme({
    required this.primaryColor,
    required this.accentColor,
    required this.dangerColor,
    required this.successColor,
  });

  factory PolarisTheme.defaultTheme() {
    return PolarisTheme(
      primaryColor: const Color(0xFF1976D2),
      accentColor: const Color(0xFFFF9800),
      dangerColor: const Color(0xFFF44336),
      successColor: const Color(0xFF4CAF50),
    );
  }
}

class LoanBreakdown {
  final double capital;
  final double initiationFee;
  final double serviceFee;
  final double interest;
  final double vat;
  final double totalRepayable;
  final DateTime dueDate;

  LoanBreakdown({
    required this.capital,
    required this.initiationFee,
    required this.serviceFee,
    required this.interest,
    required this.vat,
    required this.totalRepayable,
    required this.dueDate,
  });
}

class PolarisSession {
  final String userId;
  final String authToken;
  final bool hasActiveLoan;
  final bool isEligibleToApply;

  PolarisSession({
    required this.userId,
    required this.authToken,
    required this.hasActiveLoan,
    required this.isEligibleToApply,
  });
}

class PolarisUserPrefill {
  final String? firstName;
  final String? lastName;
  final String? idNumber;
  final String? phone;
  final String? email;
  final String? addressLine1;
  final String? city;

  PolarisUserPrefill({
    this.firstName,
    this.lastName,
    this.idNumber,
    this.phone,
    this.email,
    this.addressLine1,
    this.city,
  });
}

class LoanEligibility {
  final bool isEligible;
  final double maxAllowedAmount;
  final String? reason;

  LoanEligibility({
    required this.isEligible,
    required this.maxAllowedAmount,
    this.reason,
  });
}

class LoanApplication {
  final String id;
  final String userId;
  final double amount;
  final int termDays;
  final LoanApplicationStatus status;
  final DateTime createdAt;

  LoanApplication({
    required this.id,
    required this.userId,
    required this.amount,
    required this.termDays,
    required this.status,
    required this.createdAt,
  });
}

enum LoanApplicationStatus { draft, pending, approved, declined }

class ActiveLoan {
  final String id;
  final String userId;
  final double amountOwed;
  final double totalRepayable;
  final DateTime dueDate;
  final DateTime disbursedAt;

  ActiveLoan({
    required this.id,
    required this.userId,
    required this.amountOwed,
    required this.totalRepayable,
    required this.dueDate,
    required this.disbursedAt,
  });
}

class LoanTransaction {
  final String id;
  final String loanId;
  final double amount;
  final DateTime date;
  final LoanTransactionType type;

  LoanTransaction({
    required this.id,
    required this.loanId,
    required this.amount,
    required this.date,
    required this.type,
  });
}

enum LoanTransactionType { disbursement, repayment, feeDebit }

class LoanApplicationPayload {
  final double amount;
  final int termDays;
  final String idNumber;
  final double monthlyIncome;
  final double monthlyExpenses;
  // File paths or IDs for documents
  final String? idDocumentFront;
  final String? idDocumentBack;
  final String? bankStatement;
  final String? selfie;

  LoanApplicationPayload({
    required this.amount,
    required this.termDays,
    required this.idNumber,
    required this.monthlyIncome,
    required this.monthlyExpenses,
    this.idDocumentFront,
    this.idDocumentBack,
    this.bankStatement,
    this.selfie,
  });

  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'termDays': termDays,
      'idNumber': idNumber,
      'monthlyIncome': monthlyIncome,
      'monthlyExpenses': monthlyExpenses,
      'idDocumentFront': idDocumentFront,
      'idDocumentBack': idDocumentBack,
      'bankStatement': bankStatement,
      'selfie': selfie,
    };
  }

  factory LoanApplicationPayload.fromJson(Map<String, dynamic> json) {
    return LoanApplicationPayload(
      amount: (json['amount'] as num).toDouble(),
      termDays: json['termDays'] as int,
      idNumber: json['idNumber'] as String,
      monthlyIncome: (json['monthlyIncome'] as num).toDouble(),
      monthlyExpenses: (json['monthlyExpenses'] as num).toDouble(),
      idDocumentFront: json['idDocumentFront'] as String?,
      idDocumentBack: json['idDocumentBack'] as String?,
      bankStatement: json['bankStatement'] as String?,
      selfie: json['selfie'] as String?,
    );
  }
}
