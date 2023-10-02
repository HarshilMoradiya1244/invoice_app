import 'package:flutter/material.dart';
import 'package:invoice_app/Screen/pdf.dart';
import 'package:invoice_app/Utils/global_class.dart';

class PdfScreen extends StatefulWidget {
  const PdfScreen({super.key});

  @override
  State<PdfScreen> createState() => _PdfScreenState();
}

class _PdfScreenState extends State<PdfScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:AppBar(
          centerTitle:true,
          backgroundColor:Colors.white10,
          title: Text("Welcome ",style:TextStyle(color: Colors.black),),
          leading:IconButton(onPressed: (){
            Navigator.pop(context);
          },icon:Icon(Icons.arrow_back,color: Colors.black,),),
          actions: [
            IconButton(onPressed:(){
              pdfMaker();
            },
                icon:Icon(Icons.print,color: Colors.black,))

          ],
        ),
        body:Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(scrollDirection:Axis.vertical,
            child: Column(
              children: [
                Text(" I Khodal Mobile",style: TextStyle(color:Colors.black,fontSize:25,fontWeight: FontWeight.bold),),
                Container(
                  height:40,
                  width:180,
                  decoration:BoxDecoration(border: Border.all(color: Colors.black)),
                  child:Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Invoice No :- 123468994",style: TextStyle(fontWeight:FontWeight.bold),),
                  ),
                ),
                SizedBox(height: 2),
                Container(
                  height:40,
                  width:180,
                  decoration:BoxDecoration(border: Border.all(color: Colors.black)),
                  child:Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Date :- 2/10/2023",style: TextStyle(fontWeight:FontWeight.bold),),
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("==========================================="),
                        Align(alignment: Alignment.center,child: Text("Address :- \nG-102 / PodarArcade , Near Railway Station , \n Varachha , Surat , Gujrat",style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold),)),
                        Text("==========================================="),
                      ],
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: Text(" Product Name ",style: TextStyle(color:Colors.black,fontSize:15,fontWeight: FontWeight.bold))),
                    Expanded(child: Text(" Price ",style: TextStyle(color:Colors.black,fontSize:15,fontWeight: FontWeight.bold))),
                    Expanded(child: Text(" Quantity ",style: TextStyle(color:Colors.black,fontSize:15,fontWeight: FontWeight.bold))),
                    Expanded(child: Text(" Total ",style: TextStyle(color:Colors.black,fontSize:15,fontWeight: FontWeight.bold))),
                  ],
                ),
                SizedBox(height: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:Global.g1.InvoiceList.map((e) =>Row(
                    children: [
                      Expanded(child:Text("${e['ProductName']}",style: TextStyle(color:Colors.grey.shade600,fontSize:15,fontWeight: FontWeight.bold),),),
                      Expanded(child:Text("${e['Price']}",style: TextStyle(color:Colors.grey.shade600,fontSize:15,fontWeight: FontWeight.bold),),),
                      Expanded(child:Text("${e['Quantity']}",style: TextStyle(color:Colors.grey.shade600,fontSize:15,fontWeight: FontWeight.bold),),),
                      Expanded(child:Text("${e['Total']}",style: TextStyle(color:Colors.grey.shade600,fontSize:15,fontWeight: FontWeight.bold),),),
                    ],
                  )).toList(),
                )
              ],
            ),
          ),
        ),
    ),
    );
  }
}