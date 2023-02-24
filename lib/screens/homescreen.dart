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

List<InvoiceModle> productList = [];

String? name;
String? q;
String? price;
int fq = 0;
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
                  productList.clear();
                  fq = 0;
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
                  itemCount: productList.length,
                  itemBuilder: (context, index) {
                    return productBox(index,productList[index].productName!,productList[index].productQty!,productList[index].productPrice!);
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
                                         // productName.add(txtProduct.text);
                                         // productQty.add(txtQty.text);
                                         // productPrice.add(txtPrice.text);

                                          name = txtProduct.text;
                                          q = txtQty.text;
                                          price = txtPrice.text;
                                          double amt = double.parse(txtPrice.text)+((double.parse(txtPrice.text)*18)/100);
                                          String amount = amt.toString();
                                          fq = fq + int.parse(txtQty.text);
                                          //print(fq);
                                          int i = 0;
                                         InvoiceModle i1 = InvoiceModle(productName: name,productPrice: price,productQty: q,productAmount:amount,);
                                         productList.add(i1);
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


                      InkWell(onTap: () {
                        int sumQ = 0;
                        double  sumA= 0;
                        setState(() {
                          for(int i=0; i<productList.length; i++)
                            {
                              sumQ = sumQ + int.parse(productList[i].productQty!);
                              sumA = sumA + double.parse(productList[i].productPrice!);
                            }
                          totalModel t1 = totalModel(prList: productList,totalQ: sumQ,totalAmount: sumA);
                          Navigator.pushNamed(context, 'invoice',arguments: t1);
                        });
                      },child: customButtonForAddInvoiceGenerate()),
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

  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


  Widget productBox(int i,String pname,String q,String price) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: PopupMenuButton(
        offset: Offset(20,20),
        shape: OutlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 1.5)),
        itemBuilder: (context) {
          return [
            PopupMenuItem(onTap: () {
              print("hi");
             Future.delayed(Duration(seconds: 0),() =>  showDialog(context: context, builder: (context) {
               return AlertDialog(
                 content: Column(
                   mainAxisSize: MainAxisSize.min,
                   children: [
                     SizedBox(height: 15,),
                     TextFormField(
                       style: TextStyle(letterSpacing: 2),
                       controller: txtProduct,
                       decoration: InputDecoration(
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
                     SizedBox(height: 15,),
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
                     SizedBox(height: 15,),
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
                     SizedBox(height: 30,),

                     InkWell(
                       onTap: () {
                         setState(() {
                           productList[i].productName = txtProduct.text;
                           productList[i].productQty = txtQty.text;
                           productList[i].productPrice = txtPrice.text;
                           Navigator.pop(context);
                         });
                       },
                       child: Container(
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
                             Text("Edit",
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
                       ),
                     ),

                   ],
                 ),
               );
             },),);
              setState(() {

                txtProduct = TextEditingController(text: "$pname");
                txtQty = TextEditingController(text: "$q");
                txtPrice = TextEditingController(text: "$price");

                print("hiii");
              });
            },child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [Text("Edit",style: GoogleFonts.outfit(letterSpacing: 2),),Icon(Icons.edit)]),),

            PopupMenuItem(onTap: () {
              setState(() {

                productList.removeAt(i);

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
