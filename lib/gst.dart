import 'package:flutter/material.dart';

class gst extends StatefulWidget {
  const gst({super.key});

  @override
  State<gst> createState() => _gstState();
}

class _gstState extends State<gst> {
  TextEditingController amount = TextEditingController();
  TextEditingController gst = TextEditingController();
  TextEditingController gst_amount = TextEditingController();
  TextEditingController total_amount = TextEditingController();
  double res = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.blue,
                  Colors.white,
                ])),
        child: Column(
          children: [
            Center(
              child: Text(
                "GST Calxulator",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                style: TextStyle(fontSize: 25),
                controller: amount,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Amount",
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                style: TextStyle(fontSize: 25),
                controller: gst,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Gst",
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        double a = double.parse(amount.text); // formula
                        double b = double.parse(gst.text);
                        double c = a - (a * (100 / (100 + b)));
                        double t = a - c;
                        //print(t);
                        total_amount.text = t.toStringAsFixed(2);
                        gst_amount.text = c.toString();
                      });
                    },
                    child: Text(
                      "inclusive",
                      style: TextStyle(fontSize: 25),
                    )),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        double a = double.parse(amount.text);
                        double b = double.parse(gst.text);
                        double c = (a * b) / 100;
                        double t = a + c;
                        total_amount.text = t.toStringAsFixed(2);
                        gst_amount.text = c.toString();
                      });
                    },
                    child: Text(
                      "Exclusive",
                      style: TextStyle(fontSize: 25),
                    )),
              ],
            ),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                style: TextStyle(fontSize: 25),
                controller: amount,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Amount",
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                style: TextStyle(fontSize: 25),
                controller: gst_amount,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Gst Amount",
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                style: TextStyle(fontSize: 25),
                controller: total_amount,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Total amount",
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
