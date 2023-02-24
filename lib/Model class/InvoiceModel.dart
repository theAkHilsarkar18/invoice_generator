
class InvoiceModle
{
  String? productName,finalQty,finalAmount,productQty,productAmount,productPrice;

  InvoiceModle({this.productName,this.productQty,this.productPrice,this.productAmount,});

}

class totalModel
{
  List<InvoiceModle>? prList;
  double? totalAmount;
  int? totalQ;

  totalModel({this.prList,this.totalAmount,this.totalQ});
}