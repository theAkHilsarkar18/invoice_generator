import 'package:flutter/material.dart';
import 'package:invoice_generator/Model%20class/InvoiceModel.dart';

class Demo extends StatefulWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {

    List<InvoiceModle> i1 = ModalRoute.of(context)?.settings.arguments as List<InvoiceModle>;

    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("${i1[0].productName}"),
            Text("${i1[0].productQty}"),
            Text("${i1[0].productPrice}"),
          ],
        ),
      ),
    );
  }
}
