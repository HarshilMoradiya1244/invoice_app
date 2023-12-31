import 'package:flutter/material.dart';

import '../Utils/global_class.dart';

class InvoiceGenrate extends StatefulWidget {
  const InvoiceGenrate({super.key});

  @override
  State<InvoiceGenrate> createState() => _InvoiceGenrateState();
}

class _InvoiceGenrateState extends State<InvoiceGenrate> {
  TextEditingController txtProductName = TextEditingController();
  TextEditingController txtProductNo = TextEditingController();
  TextEditingController txtGST = TextEditingController();
  TextEditingController txtDiscount = TextEditingController();
  TextEditingController txtQuantity = TextEditingController();
  TextEditingController txtprice = TextEditingController();
  TextEditingController txttotal = TextEditingController();


  double total = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: const Text("Invoice Genrater",
              style: TextStyle(fontSize: 20, color: Colors.white)),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.share,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.picture_as_pdf,
                color: Colors.white,
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                textTile(txtProductName, 'Product Name',TextInputType.name),
                const SizedBox(height: 10),
                textTile(txtProductNo, 'Product No.',TextInputType.number),
                const SizedBox(height: 10),
                textTile(txtGST, 'GST%',TextInputType.number),
                const SizedBox(height: 10),
                textTile(txtDiscount, 'Discount',TextInputType.number),
                const SizedBox(height: 10),
                Row(
                  children: [
                    SizedBox(
                        width: 150, child: textTile(txtQuantity, "Quantity",TextInputType.number),
                    ),
                    const SizedBox(width: 10),
                    SizedBox(width: 180, child: textTile(txtprice, "Price",TextInputType.number),
                    ),
                  ],
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        total = double.parse(txtprice.text) *
                            double.parse(txtQuantity.text);
                      });
                      Map m1 = {
                        "ProductName": txtProductName.text,
                        "GST": txtGST.text,
                        "Discount": txtDiscount.text,
                        "Quantity": txtQuantity.text,
                        "Price": txtprice.text,
                        "ProductNo": txtProductNo.text,
                        "Total":total,
                      };
                      Global.g1.InvoiceList.add(m1);

                      Future.delayed(Duration(seconds: 3), () {
                        Navigator.pop(context);
                      });
                      print(Global.g1.InvoiceList);
                    },
                    child: const Text("NEXT")),
                Text(
                  "Total Payment :${total}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextField textTile(
    TextEditingController controller,
    String hint,TextInputType keyboard
  ) {
    return TextField(
      controller: controller,
      keyboardType: keyboard,
      decoration: InputDecoration(
        label: Text(
          hint,
          style: TextStyle(
            color: Colors.grey.shade400,
          ),
        ),
      ),
    );
  }
}
