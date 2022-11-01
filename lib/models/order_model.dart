class Order {
  String? id;
  String? amountFunding;
  String? timeFinancing;
  String? serviceFee;
  String? totalAmount;
  String? nationalIdNumber;
  String? walletNumber;
  String? orderStatus;
  String? paymentDate;
  String? isPay;
  String? periodLate;
  String? feeLate;

  Order({
    this.amountFunding,
    this.timeFinancing,
    this.serviceFee,
    this.totalAmount,
    this.nationalIdNumber,
    this.walletNumber,
    this.orderStatus,
    this.paymentDate,
    this.isPay,
    this.id,
    this.periodLate,
    this.feeLate,
  });

  Order.fromJson(Map<String, dynamic> json) {
    walletNumber = json['wallet_number'];
    nationalIdNumber = json['national_id_number'];
    amountFunding = json['amount_funding'];
    id = json['id_order'];
    orderStatus = json['order_status'];
    paymentDate = json['payment_date'];
    serviceFee = json['service_fee'];
    isPay = json['is_pay'];
    totalAmount = json['total_amount'];
    timeFinancing = json['time_financing'];
    periodLate = json['period_late'];
    feeLate = json['fee_late'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id_order': id,
      'is_pay': isPay,
      'order_status': orderStatus,
      'payment_date': paymentDate,
      'wallet_number': walletNumber,
      'total_amount': totalAmount,
      'service_fee': serviceFee,
      'time_financing': timeFinancing,
      'amount_funding': amountFunding,
      'national_id_number': nationalIdNumber,
      'period_late': periodLate,
      'fee_late': feeLate,
    };
  }
}
