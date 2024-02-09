import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result = '';
  var bgColors = Colors.indigo.shade200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BMI Calculators"),
        ),
        body: Container(
          color: bgColors,
          // color: Colors.indigo.shade200,
          child: Center(
            child: Container(
              child: Container(
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "BMI",
                      style:
                          TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 21,
                    ),
                    TextField(
                      controller: wtController,
                      decoration: InputDecoration(
                        label: Text('Enter your weight (in Kgs)'),
                        prefixIcon: Icon(Icons.line_weight),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    TextField(
                      controller: ftController,
                      decoration: InputDecoration(
                        label: Text('Enter your height(in feet)'),
                        prefixIcon: Icon(Icons.height),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    TextField(
                      controller: inController,
                      decoration: InputDecoration(
                        label: Text('Enter your height(in inch)'),
                        prefixIcon: Icon(Icons.height),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          var wt = wtController.text;
                          var ft = ftController.text;
                          var inch = inController.text;

                          if (wt != "" && ft != "" && inch != "") {
                            //BMI calculations

                            var iWt = int.parse(wt);
                            var iFt = int.parse(ft);
                            var iInch = int.parse(inch);

                            var tInch = (iFt * 12) + iInch;

                            var tCm = tInch * 2.54;
                            var tM = tCm / 100;
                            var BMI = iWt / (tM * tM);

                            var msg = "";

                            if (BMI > 25) {
                              bgColors = Colors.orange.shade200;
                              msg = 'youre over weight';
                            } else if (BMI < 18) {
                              bgColors = Colors.red.shade200;
                              msg = "youre under weight";
                            } else {
                              msg = "youre healthy!!";
                              bgColors = Colors.green.shade200;
                            }

                            result =
                                "$msg \n Your BMI is ${BMI.toStringAsFixed(2)}";
                            setState(() {});
                          } else {
                            setState(() {});

                            result = "Please fill all the required blank";
                          }
                        },
                        child: Text("Calculate")),
                    SizedBox(
                      height: 11,
                    ),
                    Text(
                      result,
                      style: TextStyle(fontSize: 19),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
