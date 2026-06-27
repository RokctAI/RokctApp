abstract class PolarisWalletBridge {
  Future<void> onLoanDisbursed(double amount, String reference);
  Future<void> onRepaymentReceived(double amount, String reference);
  Future<void> onInitiationFeeDebited(double amount, String reference);
}
