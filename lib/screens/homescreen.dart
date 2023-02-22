import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:invoice_generator/Model%20class/InvoiceModel.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}
//...............................................................................................................

TextEditingController txtProduct = TextEditingController();
TextEditingController txtDiscount = TextEditingController();
TextEditingController txtQty = TextEditingController();
TextEditingController txtAmount = TextEditingController();
TextEditingController txtPrice = TextEditingController();

List productList = [];

List productName = [];
List productQty = [];
List productPrice = [];
List productIndex = [];
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
          centerTitle: true,
          leading: Icon(Icons.all_inclusive, color: Colors.black, size: 30),
          title: Text("Bridal Studio",
              style: GoogleFonts.philosopher(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w500)),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(onTap: () {
                setState(() {
                  productName.clear();
                  productQty.clear();
                  productPrice.clear();
                  productIndex.clear();
                });
              },child: Icon(Icons.refresh, color: Colors.black)),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                child: ListView.builder(
                  itemCount: productName.length,
                  itemBuilder: (context, index) {
                    return InkWell(onTap: () {
                      setState(() {
                        productIndex.add(index);
                      });
                    },child: productBox(index,productName[index],productQty[index],productPrice[index]));
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                          onTap: () {
                            setState(() {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                    content: Container(
                                  height: 300,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextFormField(
                                        style: TextStyle(letterSpacing: 2),
                                        controller: txtProduct,
                                        decoration: InputDecoration(
                                          hintText: "Shervani",
                                          labelText: "Product Name",
                                          labelStyle:
                                              TextStyle(color: Colors.black),
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.black,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black,
                                                  width: 2),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                        ),
                                      ),
                                      TextFormField(
                                        controller: txtQty,
                                        style: TextStyle(letterSpacing: 2),
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          hintText: "1",
                                          labelText: "Product Qty",
                                          labelStyle:
                                              TextStyle(color: Colors.black),
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.black,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black,
                                                  width: 2),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                        ),
                                      ),
                                      TextFormField(
                                        style: TextStyle(letterSpacing: 2),
                                        controller: txtPrice,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          hintText: "12000",
                                          labelText: "Product Price",
                                          labelStyle:
                                              TextStyle(color: Colors.black),
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.black,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black,
                                                  width: 2),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                        ),
                                      ),

                                      InkWell(onTap: () {
                                       setState(() {
                                         productName.add(txtProduct.text);
                                         productQty.add(txtQty.text);
                                         productPrice.add(txtPrice.text);
                                         Navigator.pop(context);
                                       });
                                      },child: customButtonForAddProduct(),),
                                    ],
                                  ),
                                ),
                                ),
                              );
                            });
                          },
                          child: customButtonForAddProduct()),


                      customButtonForAddInvoiceGenerate(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget productBox(int i,String pname,String q,String price) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: PopupMenuButton(
        offset: Offset(20,20),
        shape: OutlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 1.5)),

        itemBuilder: (context) {
          return [
            PopupMenuItem(child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [Text("Edit",style: GoogleFonts.outfit(letterSpacing: 2),),Icon(Icons.edit)]),),

            PopupMenuItem(onTap: () {
              setState(() {

                productName.removeAt(i);
                productQty.removeAt(i);
                productPrice.removeAt(i);

              });
            },child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [Text("Delete",style: GoogleFonts.outfit(letterSpacing: 2),),Icon(Icons.delete)]),),
          ];
        },
        child: Container(
          padding: EdgeInsets.all(5),
          height: 80,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1.5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("No.", style: GoogleFonts.ptMono()),
                  Text("Product Name (Oty)", style: GoogleFonts.ptMono()),
                  Text("Price", style: GoogleFonts.ptMono()),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("$i", style: GoogleFonts.ptMono()),
                  Text("${pname} (${q})", style: GoogleFonts.ptMono()),
                  Text("${price}", style: GoogleFonts.ptMono()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget customButtonForAddProduct() {
    return Container(
      height: 40,
      width: 130,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(40),
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Product",
              style:
                  GoogleFonts.outfit(color: Colors.white, letterSpacing: 1)),
          SizedBox(
            width: 5,
          ),
          Icon(
            Icons.add,
            color: Colors.white,
            size: 18,
          )
        ],
      ),
    );
  }

  Widget customButtonForAddInvoiceGenerate() {
    return Container(
      height: 40,
      width: 130,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(40),
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Invoice",
              style: GoogleFonts.outfit(color: Colors.white, letterSpacing: 1)),
          SizedBox(
            width: 5,
          ),
          Icon(
            Icons.download,
            color: Colors.white,
            size: 18,
          )
        ],
      ),
    );
  }
}
