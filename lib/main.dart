import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.redAccent)),
      home: const MyHomePage(title: 'Program Calculate'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _gallonController = TextEditingController();

  double gallon = 0;
  double liter = 0;

  void calculate() {
    gallon = double.tryParse(_gallonController.text) ?? 0;

    setState(() {
      liter = gallon * 3.78541;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            const Text(
              'Convert gallons to liters.',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.redAccent,
              ),
            ),
            SizedBox(height: 5,),
            Text('Liter Is : ${liter.toStringAsFixed(5)}',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Colors.redAccent,
              ),),
            SizedBox(height: 20,),

            Center(
              child: SizedBox(
                width: 350,
                child: TextField(
                  controller: _gallonController,
                  decoration: InputDecoration(
                    labelText: 'Enter Gallon',
                    prefixIcon: Icon(Icons.local_gas_station),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ),


            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () => calculate(),
              child: Text("Calculate"),
            ),
          ],
        ),
      ),
    );
  }
}
