class WalletSummaryModel {
  int? walletBalance;
  int? totalSendMoneyAmount;
  int? totalReceivedMoneyAmount;
  int? totalWithdrawRequestAmount;

  WalletSummaryModel({
    this.walletBalance,
    this.totalSendMoneyAmount,
    this.totalReceivedMoneyAmount,
    this.totalWithdrawRequestAmount,
  });

  WalletSummaryModel.fromJson(Map<String, dynamic> json) {
    walletBalance = json['wallet_balance'];
    totalSendMoneyAmount = json['total_send_money_amount'];
    totalReceivedMoneyAmount = json['total_received_money_amount'];
    totalWithdrawRequestAmount = json['total_withdraw_request_amount'];
  }

  Map<String, dynamic> toJson() {
    return {
      'wallet_balance': walletBalance,
      'total_send_money_amount': totalSendMoneyAmount,
      'total_received_money_amount': totalReceivedMoneyAmount,
      'total_withdraw_request_amount': totalWithdrawRequestAmount,
    };
  }
}
