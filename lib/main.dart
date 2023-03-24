import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = "";
  var bgColor;
  var btColor;
  var hText = 'BMI';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your BMI'),
        centerTitle: true,
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                hText,
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 21.0,
              ),
              TextField(
                controller: wtController,
                decoration: const InputDecoration(
                    label: Text('Enter your weight in KG'),
                    prefixIcon: Icon(Icons.line_weight)),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 11.0,
              ),
              TextField(
                controller: ftController,
                decoration: const InputDecoration(
                    label: Text('Enter your height (in feet)'),
                    prefixIcon: Icon(Icons.trending_up)),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 11.0,
              ),
              TextField(
                controller: inController,
                decoration: const InputDecoration(
                    label: Text('Enter your height (in inch)'),
                    prefixIcon: Icon(Icons.height)),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 15.0,
              ),
              ElevatedButton(
                  onPressed: () {
                    var wt = wtController.text.toString();
                    var ft = ftController.text.toString();
                    var inch = inController.text.toString();
                    if (wt != "" && ft != "" && inch != "") {
                      // Todo: calculate BMI
                      var iWt = int.parse(wt);
                      var iFt = int.parse(ft);
                      var iInch = int.parse(inch);

                      var tInch = (iFt * 12) + iInch;
                      var tCm = tInch * 2.54;
                      var tM = tCm / 100;
                      var bmi = iWt / (tM * tM);
                      var msg = "";

                      if (bmi > 25) {
                        msg = "You are over weight";
                        bgColor = Colors.orange[200];
                        hText = "😋";
                      } else if (bmi < 18) {
                        msg = "You are under weight";
                        bgColor = Colors.red[200];
                        hText = "💀";
                      } else {
                        msg = "You are Healthy 😊";
                        bgColor = Colors.green[200];
                        hText = "💪";
                      }
                      setState(() {
                        // bgColor = Colors.green[200];
                        btColor = Colors.blue;

                        result =
                            "$msg \nYour BMI is : ${bmi.toStringAsFixed(3)}";
                      });
                    } else {
                      setState(() {
                        btColor = Colors.red[900];
                        result = 'Please fill all required field';
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(primary: btColor),
                  child: Text('Calculate')),
              const SizedBox(
                height: 15.0,
              ),
              Text(
                result,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
