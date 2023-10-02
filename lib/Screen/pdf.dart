import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart'
;

import '../Utils/global_class.dart';

void pdfMaker()async{
  final pdf = pw.Document();

  pdf.addPage(pw.Page(
      pageFormat: PdfPageFormat.a4,
      build:(context) {
        return pw.Center(
          child: pw.Column(
            children: [
              pw.Text(" I Khodal Mobile",style: pw.TextStyle(fontSize:25,fontWeight: pw.FontWeight.bold),),
              pw.Container(
                height:40,
                width:180,
                decoration:pw.BoxDecoration(border: pw.Border.all(color: PdfColors.black)),
                child:pw.Padding(
                  padding:pw.EdgeInsets.all(8.0),
                  child: pw.Text("Invoice No :- 123468994",style: pw.TextStyle(fontWeight:pw.FontWeight.bold),),
                ),
              ),
             pw. SizedBox(height: 2),
              pw.Container(
                height:40,
                width:180,
                decoration:pw.BoxDecoration(border: pw.Border.all(color: PdfColors.black)),
                child:pw.Padding(
                  padding:pw.EdgeInsets.all(8.0),
                  child: pw.Text("Date :- 2/10/2023",style: pw.TextStyle(fontWeight:pw.FontWeight.bold),),
                ),
              ),
             pw. SizedBox(height: 15),
             pw. Row(
               crossAxisAlignment: pw.CrossAxisAlignment.center,
               children: [
                pw.  Column(
                    children: [
                      pw.Text("==========================================="),
                      pw.Align(alignment: pw.Alignment.center,child: pw.Text("Address :- \n \t\t\t\t\t\t\tG-102 / PodarArcade , Near Railway Station , \n\t\t\t\t\t\t\t Varachha , Surat , Gujrat",style: pw.TextStyle(fontWeight: pw.FontWeight.bold),)),
                      pw.Text("==========================================="),
                    ],
                  ),
                ],
              ),
             pw. Row(
               crossAxisAlignment: pw.CrossAxisAlignment.center,
               children: [
                  pw.Expanded(child: pw.Text(" Product Name ",style: pw.TextStyle(fontSize:15,fontWeight: pw.FontWeight.bold))),
                  pw.Expanded(child: pw.Text(" Price ",style: pw.TextStyle(fontSize:15,fontWeight:pw. FontWeight.bold))),
                  pw.Expanded(child: pw.Text(" Quantity ",style: pw.TextStyle(fontSize:15,fontWeight:pw. FontWeight.bold))),
                  pw.Expanded(child: pw.Text(" Total ",style: pw.TextStyle(fontSize:15,fontWeight:pw. FontWeight.bold))),
                ],
              ),
             pw. SizedBox(height: 15),
            pw.  Column(
                crossAxisAlignment: pw.CrossAxisAlignment.center,
                children:Global.g1.InvoiceList.map((e) =>pw.Row(
                  children: [
                    pw.Expanded(child:pw.Text("${e['ProductName']}",style: pw.TextStyle(fontSize:15,fontWeight: pw.FontWeight.bold),),),
                    pw.Expanded(child:pw.Text("${e['Price']}",style: pw.TextStyle(fontSize:15,fontWeight: pw.FontWeight.bold),),),
                    pw.Expanded(child:pw.Text("${e['Quantity']}",style: pw.TextStyle(fontSize:15,fontWeight: pw.FontWeight.bold),),),
                    pw.Expanded(child:pw.Text("${e['Total']}",style: pw.TextStyle(fontSize:15,fontWeight: pw.FontWeight.bold),),),
                  ],
                )).toList(),
              )
            ],
          ),
        ); // Center
      })); // Page
  await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save());
}