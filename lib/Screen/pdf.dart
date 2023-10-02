import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

void pdfMaker(){
  final pdf = pw.Document();

  pdf.addPage(pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Center(
          child: pw.Column(
            children: [
              pw.Text(" I Khodal Mobile",style:   pw.TextStyle(color:Colors.black,fontSize:25,fontWeight: FontWeight.bold),),
              pw.Container(
                height:40,
                width:180,
                decoration:  pw.pw.BoxDecoration(border: Border.all(color: Colors.black)),
                child:  pw.pw.Padding(
                  pw.Padding: const EdgeInsets.all(8.0),
                  child:   pw.Text("Invoice No :- 123468994",style: TextStyle(fontWeight:FontWeight.bold),),
                ),
              ),
              pw. pw. SizedBox(height: 2),
              pw.Container(
                height:40,
                width:180,
                decoration:pw.BoxDecoration(border: Border.all(color: Colors.black)),
                child:pw.Padding(
                  pw.Padding: const EdgeInsets.all(8.0),
                  child: Text("Date :- 2/10/2023",style: TextStyle(fontWeight:FontWeight.bold),),
                ),
              ),
              pw. SizedBox(height: 15),
             pw. Row(
                children: [
                 pw. Column(
                    children: [
                      Text("==========================================="),
                      Align(alignment: Alignment.center,child: Text("Address :- \n \t\t\t\t\t\t\tG-102 / PodarArcade , Near Railway Station , \n\t\t\t\t\t\t\t Varachha , Surat , Gujrat",style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold),)),
                      Text("==========================================="),
                    ],
                  ),
                ],
              ),
             pw. Row(
                children: [
                  pw.Expanded(child: Text(" Product Name ",style: TextStyle(color:Colors.black,fontSize:15,fontWeight: FontWeight.bold))),
                  pw.Expanded(child: Text(" Price ",style: TextStyle(color:Colors.black,fontSize:15,fontWeight: FontWeight.bold))),
                  pw.Expanded(child: Text(" Quantity ",style: TextStyle(color:Colors.black,fontSize:15,fontWeight: FontWeight.bold))),
                  pw.Expanded(child: Text(" Total ",style: TextStyle(color:Colors.black,fontSize:15,fontWeight: FontWeight.bold))),
                ],
              ),
              pw. SizedBox(height: 15),
             pw. Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children:Global.g1.InvoiceList.map((e) =>Row(
                  children: [
                    pw.Expanded(child:Text("${e['ProductName']}",style: TextStyle(color:Colors.grey.shade600,fontSize:15,fontWeight: FontWeight.bold),),),
                    pw.Expanded(child:Text("${e['Price']}",style: TextStyle(color:Colors.grey.shade600,fontSize:15,fontWeight: FontWeight.bold),),),
                    pw.Expanded(child:Text("${e['Quantity']}",style: TextStyle(color:Colors.grey.shade600,fontSize:15,fontWeight: FontWeight.bold),),),
                    pw.Expanded(child:Text("${e['Total']}",style: TextStyle(color:Colors.grey.shade600,fontSize:15,fontWeight: FontWeight.bold),),),
                  ],
                )).toList(),
              )
            ],
          ),
            ,
        ); // Center
      })
  ); // Page
}