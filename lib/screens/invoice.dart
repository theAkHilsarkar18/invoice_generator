import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:invoice_generator/Model%20class/InvoiceModel.dart';
import 'dart:ui' as ui;

class InvoiceGenerator extends StatefulWidget {
  const InvoiceGenerator({Key? key}) : super(key: key);

  @override
  State<InvoiceGenerator> createState() => _InvoiceGeneratorState();
}

class _InvoiceGeneratorState extends State<InvoiceGenerator> {
  @override

  final globalkey = new GlobalKey();
  Widget build(BuildContext context) {
    InvoiceModle invoice = ModalRoute.of(context)?.settings.arguments as InvoiceModle;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RepaintBoundary(
            key: globalkey,
            child: Center(
              child: Column(
                children: [
                  Text("${invoice.productName}",style: TextStyle(color: Colors.pink)),
                  Text("${invoice.productDiscount}",style: TextStyle(color: Colors.pink)),
                  Text("${invoice.productQty}",style: TextStyle(color: Colors.pink)),
                  Text("${invoice.productAmount}",style: TextStyle(color: Colors.pink)),
                  SizedBox(height: 20,),
                  ElevatedButton(onPressed: () {
                    imageGenerator();
                  }, child: Text("Create"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void imageGenerator()
  async{
    RenderRepaintBoundary boundary = RenderRepaintBoundary();
    boundary = globalkey.currentContext?.findRenderObject() as RenderRepaintBoundary;

    ui.Image image = await boundary.toImage(pixelRatio: 3.0);

    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);

    var pngBytes = byteData?.buffer.asUint8List();

    final result = await ImageGallerySaver.saveImage(pngBytes!,name: "first",quality: 60);
    print(result);
  }


}
