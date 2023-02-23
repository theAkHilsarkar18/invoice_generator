import 'package:flutter/material.dart';
import 'package:invoice_generator/screens/demo.dart';
import 'package:invoice_generator/screens/homescreen.dart';
import 'package:invoice_generator/screens/invoice.dart';

void main()
{
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/' : (context) => Homescreen(),
        'invoice' : (context) => InvoiceGenerator(),
        'demo' : (context) => Demo(),
      },
    ),
  );
}