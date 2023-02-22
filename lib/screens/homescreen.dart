import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
TextEditingController txtPrice = TextEditingController(text: "11");




//...............................................................................................................

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
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
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: double.infinity,
            child: Column(
              children: [

                Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: 100,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Name",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 5,),
                    Expanded(
                      child: Container(
                        width: 100,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Phone",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black,width: 1.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(onPressed: () {
                        showDialog(context: context, builder: (context) {
                          return AlertDialog(
                            content: Container(
                              height: 350,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  TextField(
                                    controller: txtProduct,
                                    decoration: InputDecoration(
                                      hintText: "Product",
                                    ),
                                  ),

                                  TextField(
                                    controller: txtDiscount,
                                    decoration: InputDecoration(
                                      hintText: "Tax",
                                    ),
                                  ),

                                  TextField(
                                    controller: txtQty,
                                    decoration: InputDecoration(
                                      hintText: "Qty",
                                    ),
                                  ),

                                  TextField(
                                    controller: txtPrice,
                                    decoration: InputDecoration(
                                      hintText: "Price",
                                    ),
                                  ),

                                  TextField(
                                    controller: txtAmount,
                                    decoration: InputDecoration(
                                      hintText: "Amount",
                                    ),
                                  ),

                                  ElevatedButton(onPressed: () {

                                  }, child: Text("Add"),),
                                ],
                              ),
                            ),
                          );
                        },);
                      }, child: Text("Add"),),
                      ElevatedButton(
                        onPressed: () {
                          InvoiceModle invoice = InvoiceModle(
                              productName: txtProduct.text,
                              productDiscount: txtDiscount.text,
                              productQty: txtQty.text,
                              productPrice: txtPrice.text,
                          productAmount: txtAmount.text,
                          );
                          Navigator.pushNamed(context, 'invoice', arguments: invoice);
                        },
                        child: Text("Generate"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
