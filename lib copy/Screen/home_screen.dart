import 'dart:ffi';

import 'package:flutter/material.dart';

import '../Utils/global_class.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: Text(
            "Product Manage",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(onPressed: () {
              Navigator.pushNamed(context,'pdf');
            }, icon: Icon(Icons.picture_as_pdf_outlined,color: Colors.white,))
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: Global.g1.InvoiceList
                  .map(
                    (e) => Container(
                      margin: EdgeInsets.all(18),
                      height: MediaQuery.of(context).size.height * 0.13,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade300,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height:23,
                              child: Row(
                                children: [
                                  Text("Product : "'${e['ProductName']}'),
                                  Spacer( ),
                                  IconButton(onPressed: (){
                                    Navigator.pushNamed(context,'invoice');
                                  }, icon:Icon(Icons.edit)),
                                ],
                              ),
                            ),
                            Text("Product No : "'${e['ProductNo']}'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("GST % : "'${e['GST']}'),
                                    Text("Discount % : "'${e['Discount']}'),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text("Price : "'${e['Price']}'),
                                    Text("Total : "'${e['Total']}'),
                                  ],
                                ),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        Global.g1.InvoiceList.remove(e);
                                      });
                                    },
                                    icon: Icon(Icons.delete)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, 'invoice').then((value) {
              setState(() {});
            });
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
