import 'package:flutter/material.dart';
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
                    child: Text("Invoice No :- ",style: TextStyle(fontWeight:FontWeight.bold),),
                  ),
                ),
                SizedBox(height: 2),
                Container(
                  height:40,
                  width:180,
                  decoration:BoxDecoration(border: Border.all(color: Colors.black)),
                  child:Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Date :- ",style: TextStyle(fontWeight:FontWeight.bold),),
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
                      Divider(thickness:2,color:Colors.black,),
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

/*
    * const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text("-----------------------------------------------------------------------------------"),
                Text("Avenue Supermarts Ltd"),
                Text("CIN :- L51900MH2000PLC126473"),
                Text("GSTIN : 27AACCA8432H1ZQ"),
                Text("-----------------------------------------------------------------------------------"),
                Text("DMART_SURAT"),
                Text("Mota Varacha ,Main Road,\n Near Maharaja Farm,Surat"),
                Text("Phone : 022-30918200"),
                Text("-----------------------------------------------------------------------------------"),
                Column(
                  children: [
                    Text("TAX INVOICE"),
                    Row(
                      children: [
                        Text("BIll NO : 11-0015 "),
                        Spacer( ),
                        Text("Cashier  : PG/11"),
                      ],
                    ),
                    Row(
                      children: [
                        Text("BIll Dt : 10/07/2017"),
                        Spacer( ),
                        Text("Time  : 11:26 am"),
                      ],
                    ),
                    Text("-----------------------------------------------------------------------------------"),
                    Row(
                      children: [
                        Text("HSN"),
                        SizedBox(width:30),
                        Text("Particulars"),
                        SizedBox(width:30),
                        Text("Qty"),
                        SizedBox(width:30),
                        Text("Rate"),
                        SizedBox(width:30),
                        Text("Value"),
                      ],
                    ),
                    SizedBox(height:5),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("1\t\t\t\t\t\tCGST@ 0.00%     SGST@ 0.00%     CESS@ 0.00%"),SizedBox(height:3),
                            Text("50\t\t\t Basmati Rice\t\t\t\t\t\t 3\t\t\t\t\t\t\t\t\t\t\t\t\t\8.00 \t\t\t\t\t\t\t\t\t\t\t\ 24.00"),SizedBox(height:3),
                            Text("2\t\t\t\t\t\tCGST@ 0.00%     SGST@ 0.00%     CESS@ 0.00%"),SizedBox(height:3),
                            Text("100\t\t\t Meggi \t\t\t\t\t\t\t\t\t\t\t\t 10\t\t\t\t\t\t\t\t\t\t\t\t\t\ 100 \t\t\t\t\t\t\t\t\t\t\t\ 10.00"),SizedBox(height:3),
                            Text("2\t\t\t\t\t\tCGST@ 0.00%     SGST@ 0.00%     CESS@ 0.00%"),SizedBox(height:3),SizedBox(height:3),
                            Text("50\t\t\t Dairy Milk Silk \t\t\t 1 \t\t\t\t\t\t\t\t\t\t\t\t 50.00 \t\t\t\t\t\t\t\t\t\t\t\ 50.00"),SizedBox(height:3)
                          ],
                        )
                      ],
                    ),
                    Text("-----------------------------------------------------------------------------------"),
                    Row(
                      children: [
                        Text("Items : 3"),
                        SizedBox(width:50),
                        Text("Qty  : 14"),
                        SizedBox(width:50),
                        Text("Amt  : 84"),
                      ],
                    ),
                    Text("-----------------------------------------------------------------------------------"),
                    Text("<------ GST Breakup Details ------> (Amount INR)"),
                    Text("-----------------------------------------------------------------------------------"),
                    Row(
                      children: [
                        Text("Sr.\nTax"),
                        SizedBox(width:25),
                        Text("TAxable\nAmt"),
                        SizedBox(width:25),
                        Text("CGST"),
                        SizedBox(width:25),
                        Text("SGST"),
                        SizedBox(width:25),
                        Text("CESS"),
                        SizedBox(width:25),
                        Text("Total\nAmt"),
                      ],
                    ),
                    Text("-----------------------------------------------------------------------------------"),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("1.\t\t\t\t\t\t\t\t\t\t\t\ 24........................................................  24.00"),
                            Text("2.\t\t\t\t\t\t\t\t\t\t\t\ 100 \t\t\t\t\t\t\t\t  2.62  \t\t\t\t\t\t\t\t2.82..................  105.44"),
                            Text("3.\t\t\t\t\t\t\t\t\t\t\t\  50 \t\t\t\t\t\t\t\t  3.52  \t\t\t\t\t\t\t\t2.00..................   55.52"),
                            Text("T.\t\t\t\t\t\t\t\t\t\t\t\  174 \t\t\t\t\t\t  6.14  \t\t\t\t\t\t\t\t4.82..................   184.66"),
                          ],
                        ),
                      ],
                    ),
                    Text("-----------------------------------------------------------------------------------"),
                    Text("<------ Amount REcd From Customer ------>"),
                    Text("-----------------------------------------------------------------------------------"),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text("Cash Received :"),
                            Spacer( ),

                            Text("200.00 /-"),
                          ],
                        ),
                        Row(
                          children: [
                            Text("Bal Paid In Cash :"),
                            Spacer( ),
                            Text("15/-"),
                          ],
                        ),
                      ],
                    ),
                    Text("==========================================="),
                    Text("Above Prices Are Inclusive Of all Taxes \n This Is Computer Generated Invoice And \n Hence No Signature Is Required."),
                    SizedBox(height:30),
                    Text("* * Saved Rs .45.50/- On M.R.P. * *")
                  ],
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}
 */