import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
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

    //List<InvoiceModle> product = ModalRoute.of(context)!.settings.arguments as List<InvoiceModle>;

    totalModel tx = ModalRoute.of(context)!.settings.arguments as totalModel;

    return SafeArea(
      child: RepaintBoundary(
        key: globalkey,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: false,
            leading: Icon(Icons.all_inclusive,color: Colors.black,size: 30),
            title: Text("Bridal Studio",
                style: GoogleFonts.philosopher(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w500)),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(onTap: () {
                  imageGenerator();
                },child: Icon(Icons.save,color: Colors.black)),
              ),
            ],
          ),
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Marriage Shopping",
                      style: GoogleFonts.outfit(fontSize: 20, color: Colors.grey.shade700),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Name : Akhil Sodvadiya",style: GoogleFonts.ptMono()),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text("Mobile : 9825486060",style: GoogleFonts.ptMono()),
                  ),
                  SizedBox(height: 10,),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text("Product",style: GoogleFonts.outfit(fontSize: 12,letterSpacing: 1)),
                          width: 90,
                          color: Colors.grey,
                          alignment: Alignment.center,
                            padding: EdgeInsets.all(3)
                        ),
                        SizedBox(width: 5,),
                        Container(child: Text("Price",style: GoogleFonts.outfit(letterSpacing: 1,fontSize: 12)),width: 50,color: Colors.grey,alignment: Alignment.center,padding: EdgeInsets.all(3)),
                        SizedBox(width: 5,),
                        Container(child: Text("Qty",style: GoogleFonts.outfit(fontSize: 12,letterSpacing: 1)),width: 40,color: Colors.grey,alignment: Alignment.center,padding: EdgeInsets.all(3)),
                        SizedBox(width: 5,),
                        Container(child: Text("Tax",style: GoogleFonts.outfit(fontSize: 12,letterSpacing: 1)),width: 40,color: Colors.grey,alignment: Alignment.center,padding: EdgeInsets.all(3)),
                        SizedBox(width: 5,),
                        Container(child: Text("Amount",style: GoogleFonts.outfit(fontSize: 12,letterSpacing: 1)),width: 80,color: Colors.grey,alignment: Alignment.center,padding: EdgeInsets.all(3)),
                      ],
                    ),
                  ),

                  ListView.builder(physics: BouncingScrollPhysics(), shrinkWrap: true,itemBuilder: (context, index) {
                    return dataEntry(tx.prList![index].productName!,tx.prList![index].productPrice!,tx.prList![index].productQty!,"18",tx.prList![index].productAmount!);
                  },
                    itemCount: tx.prList?.length,
                  ),

                  Text("--------------------------------------------------------------------------"),

                  SizedBox(height: 20,),

                  Container(child: Text("${tx.totalQ}",style: TextStyle(fontSize: 12)),color: Colors.grey,padding: EdgeInsets.all(10)),
                  SizedBox(height: 10,),
                  Container(child: Text("Total Amount : ${tx.totalAmount}/-",style: TextStyle(fontSize: 12)),color: Colors.grey,padding: EdgeInsets.all(10)),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(height: 150,child: Image.asset("assets/images/done.png")),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("TheAkhilSarkar",style: GoogleFonts.sacramento(fontWeight: FontWeight.w600,fontSize: 18),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("19-03-2023",style: GoogleFonts.ptMono(fontWeight: FontWeight.w600,fontSize: 10),),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget dataEntry(String name, String price, String qty, String tax, String amount)
  {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Container(child: Text("$name",style: GoogleFonts.ptMono(fontSize: 11)), width: 90,alignment: Alignment.center,padding: EdgeInsets.all(3)),
          SizedBox(width: 5,),
          Container(child: Text("$price",style: GoogleFonts.ptMono(fontSize: 11)),width: 50,alignment: Alignment.center,padding: EdgeInsets.all(3)),
          SizedBox(width: 5,),
          Container(child: Text("$qty",style: GoogleFonts.ptMono(fontSize: 11)),width: 40,alignment: Alignment.center,padding: EdgeInsets.all(3),),
          SizedBox(width: 5,),
          Container(child: Text("$tax%",style: GoogleFonts.ptMono(fontSize: 11)),width: 40,alignment: Alignment.center,padding: EdgeInsets.all(3),),
          SizedBox(width: 5,),
          Container(child: Text("$amount",style: GoogleFonts.ptMono(fontSize: 11)),width: 80,alignment: Alignment.center,padding: EdgeInsets.all(3)),

        ],
      ),
    );
  }

  void imageGenerator() async {
    RenderRepaintBoundary boundary = RenderRepaintBoundary();
    boundary =
        globalkey.currentContext?.findRenderObject() as RenderRepaintBoundary;

    ui.Image image = await boundary.toImage(pixelRatio: 3.0);

    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);

    var pngBytes = byteData?.buffer.asUint8List();

    final result = await ImageGallerySaver.saveImage(pngBytes!,
        name: "first", quality: 60);
    print(result);
  }
}
