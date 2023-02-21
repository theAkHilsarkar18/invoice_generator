import 'package:flutter/material.dart';
import 'package:invoice_generator/Model%20class/InvoiceModel.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}
//...............................................................................................................

TextEditingController txtProduct = TextEditingController(text: "Meggi");
TextEditingController txtDiscount = TextEditingController(text: "10%");
TextEditingController txtQty = TextEditingController(text: "2");
TextEditingController txtAmount = TextEditingController(text: "22");

//...............................................................................................................

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: txtProduct,
                decoration: InputDecoration(
                  hintText: "Product",
                ),
              ),
              SizedBox(height: 10,),

              TextField(
                controller: txtDiscount,
                decoration: InputDecoration(
                  hintText: "Discount",
                ),
              ),
              SizedBox(height: 10,),

              TextField(
                controller: txtQty,
                decoration: InputDecoration(
                  hintText: "Qty",
                ),
              ),
              SizedBox(height: 10,),

              TextField(
                controller: txtAmount,
                decoration: InputDecoration(
                  hintText: "Amount",
                ),
              ),
              SizedBox(height: 30,),

              ElevatedButton(
                onPressed: () {
                  InvoiceModle invoice = InvoiceModle(
                      productName: txtProduct.text,
                      productDiscount: txtDiscount.text,
                      productQty: txtQty.text,
                      productAmount: txtAmount.text);
                  Navigator.pushNamed(context, 'invoice', arguments: invoice);
                },
                child: Text("Generate"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget dataEntry(String filedName, String cont) {
    return TextField(
      decoration: InputDecoration(
        hintText: "$filedName",
      ),
    );
  }
}
