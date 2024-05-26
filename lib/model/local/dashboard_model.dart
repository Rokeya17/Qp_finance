class DashboardModel {
  int? status;
  int? walletBalance;
  int? totalSendMoneyAmount;
  int? totalReceivedMoneyAmount;
  int? totalWithdrawRequestAmount;

  DashboardModel(
      {this.status,
        this.walletBalance,
        this.totalSendMoneyAmount,
        this.totalReceivedMoneyAmount,
        this.totalWithdrawRequestAmount});

  DashboardModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    walletBalance = json['wallet_balance'];
    totalSendMoneyAmount = json['total_send_money_amount'];
    totalReceivedMoneyAmount = json['total_received_money_amount'];
    totalWithdrawRequestAmount = json['total_withdraw_request_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['wallet_balance'] = this.walletBalance;
    data['total_send_money_amount'] = this.totalSendMoneyAmount;
    data['total_received_money_amount'] = this.totalReceivedMoneyAmount;
    data['total_withdraw_request_amount'] = this.totalWithdrawRequestAmount;
    return data;
  }
}
