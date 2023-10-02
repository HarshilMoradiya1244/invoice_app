import 'package:flutter/material.dart';
import 'package:invoice_app/Utils/global_class.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

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
          backgroundColor:Colors.blue,
          title: Text("Welcome PDF",style:TextStyle(color: Colors.white),),
          leading:IconButton(onPressed: (){
            Navigator.pop(context);
          },icon:Icon(Icons.arrow_back,color: Colors.white,),),
          actions: [
            IconButton(onPressed:(){}, icon:Icon(Icons.print,color: Colors.white,))
          ],
        ),
        body:Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(" I Khodal Mobile",style: TextStyle(color:Colors.black,fontSize:25,fontWeight: FontWeight.bold),),
                Container(
                  height:40,
                  width:180,
                  decoration:BoxDecoration(border: Border.all(color: Colors.black)),
                  child:Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Invoice No :- 197346825",style: TextStyle(fontWeight:FontWeight.bold),),
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
                  children: [
                    Column(
                      children: [
                        Text("==========================================="),
                        Align(alignment: Alignment.center,child: Text("Address :- \n \t\t\t\t\t\t\tG-102 / PodarArcade , Near Railway Station , \n\t\t\t\t\t\t\t Varachha , Surat , Gujrat",style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold),)),
                        Text("==========================================="),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(" Product Name ",style: TextStyle(color:Colors.black,fontSize:15,fontWeight: FontWeight.bold)),
                    Spacer( ),
                    Text(" Price ",style: TextStyle(color:Colors.black,fontSize:15,fontWeight: FontWeight.bold)),
                    Spacer( ),
                    Text(" Quantity ",style: TextStyle(color:Colors.black,fontSize:15,fontWeight: FontWeight.bold)),
                    Spacer( ),
                    Text(" Total ",style: TextStyle(color:Colors.black,fontSize:15,fontWeight: FontWeight.bold)),
                    Spacer( ),
                  ],
                ),
                SizedBox(height: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:Global.g1.InvoiceList.map((e) =>Row(
                    children: [
                      SizedBox(width: 10),
                      Column(
                        children: [
                          Text("${e['ProductName']}",style: TextStyle(color:Colors.grey.shade600,fontSize:15,fontWeight: FontWeight.bold)),
                        ],
                      ),
                      SizedBox(width:40),
                      Column(
                        children: [
                        Text("${e['Price']}",style: TextStyle(color:Colors.grey.shade600,fontSize:15,fontWeight: FontWeight.bold)),
                      ],),
                      SizedBox(width: 50),
                      Column(
                        children: [
                          Text("${e['Quantity']}",style: TextStyle(color:Colors.grey.shade600,fontSize:15,fontWeight: FontWeight.bold)),
                        ],
                      ),
                      SizedBox(width: 40),
                      Column(
                        children: [
                          Text("${e['Total']}",style: TextStyle(color:Colors.grey.shade600,fontSize:15,fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Spacer( ),],
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