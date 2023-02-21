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
    // InvoiceModle invoice = ModalRoute.of(context)?.settings.arguments as InvoiceModle;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text("Groom & Bride Studio",
              style: GoogleFonts.philosopher(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w500)),
          actions: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("19-03-2023",style: GoogleFonts.ptMono(color:Colors.black)),
                ),
                Text("9:23 pm",style: GoogleFonts.ptMono(color: Colors.black)),
              ],
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RepaintBoundary(
            key: globalkey,
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
                          child: Text("Product",style: GoogleFonts.outfit()),
                          width: 120,
                          color: Colors.grey,
                          alignment: Alignment.center,
                            padding: EdgeInsets.all(3)
                        ),
                        SizedBox(width: 5,),
                        Container(child: Text("Price",style: GoogleFonts.outfit()),width: 80,color: Colors.grey,alignment: Alignment.center,padding: EdgeInsets.all(3)),
                        SizedBox(width: 5,),
                        Container(child: Text("Qty",style: GoogleFonts.outfit()),width: 40,color: Colors.grey,alignment: Alignment.center,padding: EdgeInsets.all(3)),
                        SizedBox(width: 5,),
                        Container(child: Text("Discount",style: GoogleFonts.outfit()),alignment: Alignment.center,color: Colors.grey,width: 70,padding: EdgeInsets.all(3)),
                        SizedBox(width: 5,),
                        Container(child: Text("Amount",style: GoogleFonts.outfit()),width: 100,color: Colors.grey,alignment: Alignment.center,padding: EdgeInsets.all(3)),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Container(child: Text("Suit & Shervani",style: GoogleFonts.ptMono()), width: 120,alignment: Alignment.center),
                        SizedBox(width: 5,),
                        Container(child: Text("10000",style: GoogleFonts.ptMono()),width: 80,alignment: Alignment.center),
                        SizedBox(width: 5,),
                        Container(child: Text("6",style: GoogleFonts.ptMono()),width: 40,alignment: Alignment.center),
                        SizedBox(width: 5,),
                        Container(child: Text("10%",style: GoogleFonts.ptMono()),alignment: Alignment.center,width: 70),
                        SizedBox(width: 5,),
                        Container(child: Text("36000",style: GoogleFonts.ptMono()),width: 100,alignment: Alignment.center),

                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Container(child: Text("Lehnga",style: GoogleFonts.ptMono()), width: 120,alignment: Alignment.center),
                        SizedBox(width: 5,),
                        Container(child: Text("22000",style: GoogleFonts.ptMono()),width: 80,alignment: Alignment.center),
                        SizedBox(width: 5,),
                        Container(child: Text("1",style: GoogleFonts.ptMono()),width: 40,alignment: Alignment.center),
                        SizedBox(width: 5,),
                        Container(child: Text("10%",style: GoogleFonts.ptMono()),alignment: Alignment.center,width: 70),
                        SizedBox(width: 5,),
                        Container(child: Text("20000",style: GoogleFonts.ptMono()),width: 100,alignment: Alignment.center),

                      ],
                    ),
                  ),


                  Text("----------------------------------------------------------------------------------------------------------------------------"),

                  SizedBox(height: 20,),

                  Container(child: Text("Total Qty : 36",style: TextStyle(fontSize: 15)),color: Colors.grey,padding: EdgeInsets.all(10)),
                  SizedBox(height: 10,),
                  Container(child: Text("Total Amount : 58000/-",style: TextStyle(fontSize: 15)),color: Colors.grey,padding: EdgeInsets.all(10)),
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
                  // ElevatedButton(onPressed: () {
                  //   imageGenerator();
                  // }, child: Text("Create"))
                ],
              ),
            ),
          ),
        ),
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
